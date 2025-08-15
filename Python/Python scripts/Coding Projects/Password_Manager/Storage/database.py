import secrets
import sqlite3
from argon2 import PasswordHasher
from Crypto.cipher import encrypt_data,decrypt_data
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))  # /Password_Manager
DB_NAME = os.path.join(BASE_DIR, "Storage", "vault.db")


def init_db():
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS credentials (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            username TEXT NOT NULL,
            password TEXT NOT NULL,
            url TEXT,
            notes TEXT,
            pwnd TEXT
        )
    ''')
    cursor.execute('''
            CREATE TABLE IF NOT EXISTS master (
    id INTEGER PRIMARY KEY,
    password_hash TEXT NOT NULL,
    salt TEXT NOT NULL
)
        ''')
    conn.commit()
    conn.close()
def is_master_password_set():
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) from master")
    exists = cursor.fetchone()[0]>0
    conn.close()
    return exists

def set_master_password(password):
    ph = PasswordHasher()
    salt = secrets.token_hex(16)
    hashed_password =  ph.hash(password+salt, salt=None)
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute("INSERT INTO master (id,password_hash,salt) VALUES (1,?,?)", (hashed_password,salt))
    conn.commit()
    conn.close()
def verify_master_password(password_input):
    ph = PasswordHasher()
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute("SELECT password_hash, salt FROM master WHERE id=1")
    result = cursor.fetchone()

    if result is None:
        return False

    stored_hash, stored_salt = result

    try:
        ph.verify(stored_hash,password_input + stored_salt)
        return True
    except:
        return False

def get_master_hash():
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute("SELECT password_hash, salt FROM master WHERE id=1")
    result = cursor.fetchone()
    conn.close()
    return result

def insert_credential(title, username, password, url, notes):
    cipher_password = encrypt_data(password)
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO credentials (title, username, password, url, notes)
        VALUES (?, ?, ?, ?, ?)
    """, (title, username, cipher_password, url, notes))
    conn.commit()
    conn.close()

def get_all_credentials():
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute("SELECT id, title, username, password, url, notes FROM credentials")
    rows = cursor.fetchall()
    conn.close()

    decrypted_rows = []
    for row in rows:
        decrypted_password = decrypt_data(row[3])
        decrypted_row = (
            row[0],  # id
            row[1],  # title
            row[2],  # username
            decrypted_password,
            row[4],  # url
            row[5]   # notes
        )
        decrypted_rows.append(decrypted_row)

    return decrypted_rows


def delete_credential(entry_id):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute("DELETE FROM credentials WHERE id = ?", (entry_id,))
    conn.commit()
    conn.close()

def update_credential(entry_id, title, username, password, url, notes):
    cipher_password = encrypt_data(password)
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute("""
        UPDATE credentials
        SET title = ?, username = ?, password = ?, url = ?, notes = ?
        WHERE id = ?
    """, (title, username, cipher_password, url, notes, entry_id))
    conn.commit()
    conn.close()
