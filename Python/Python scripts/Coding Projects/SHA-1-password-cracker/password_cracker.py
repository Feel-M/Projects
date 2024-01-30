import hashlib

def compute_hash(salt, password):
    sha_1 = hashlib.sha1()
    sha_1.update((salt + password).encode())
    return sha_1.hexdigest()

def crack_sha1_hash(hash, use_salts=False):
    with open('top-10000-passwords.txt') as pass_file:
        passwords = [line.strip() for line in pass_file]

    if use_salts:
        with open('known-salts.txt') as salts_file:
            salts = [salt.strip() for salt in salts_file]
    else:
        salts = ['']

    for password in passwords:
        for salt in salts:
            hashed_appended = compute_hash(salt, password)
            hashed_prepended = compute_hash(password, salt)

            if hashed_appended == hash or hashed_prepended == hash:
                return password

    return "PASSWORD NOT IN DATABASE"


