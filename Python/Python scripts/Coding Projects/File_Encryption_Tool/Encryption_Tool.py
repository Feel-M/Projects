import os
from cryptography.fernet import Fernet

def generate_key():
    # key generation
    key = Fernet.generate_key()

    # string the key in a file
    with open('filekey.key', 'wb') as filekey:
        filekey.write(key)
def process_directory(directory, operation, key_path):
    for item in os.listdir(directory):
        item_path = os.path.join(directory, item)
        if os.path.isfile(item_path):
            operation(item_path, key_path)
        elif os.path.isdir(item_path):
            print(f"Found directory: {item_path}")
            process_directory(item_path, operation, key_path)

def encrypt_data(file_path, key_path):
    with open(key_path, 'rb') as filekey:
        key = filekey.read()
    fernet = Fernet(key)
    with open(file_path, 'rb') as file:
        original_data = file.read()
    encrypted = fernet.encrypt(original_data)
    with open(file_path, 'wb') as encrypted_file:
        encrypted_file.write(encrypted)

def decrypt_data(file_path, key_path):
    with open(key_path, 'rb') as filekey:
        key = filekey.read()
    fernet = Fernet(key)
    with open(file_path, 'rb') as file:
        encrypted_data = file.read()
    decrypted = fernet.decrypt(encrypted_data)
    with open(file_path, 'wb') as decrypted_file:
        decrypted_file.write(decrypted)

def main(path, action='encrypt', key_path='filekey.key'):
    operation = encrypt_data if action == 'encrypt' else decrypt_data
    if os.path.isfile(path):
        operation(path, key_path)
    elif os.path.isdir(path):
        print(f"Processing directory: {path}")
        process_directory(path, operation, key_path)
    else:
        print(f"{path} does not exist.")


path_to_process = 'folder'
action = 'decrypt'  # Change to 'encrypt' or 'decrypt'
key_file_path = 'filekey.key'
#main(path_to_process, action, key_file_path)
