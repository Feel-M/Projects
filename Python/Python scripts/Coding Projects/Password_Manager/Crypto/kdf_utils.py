from argon2.low_level import hash_secret_raw, Type



def derive_key(password: str, salt: bytes) -> bytes:
    return hash_secret_raw(
        secret=password.encode(),
        salt=salt,
        time_cost=3,          # Cost parameters
        memory_cost=65536,    # 64 MB
        parallelism=1,
        hash_len=32,          # 32 bytes = 256-bit AES key
        type=Type.ID          # Argon2id is best for passwords
    )

def get_key():
    from Storage.database import get_master_hash

    stored_hash, stored_salt = get_master_hash()
    salt_bytes = bytes.fromhex(stored_salt)
    return derive_key(stored_hash, salt_bytes)