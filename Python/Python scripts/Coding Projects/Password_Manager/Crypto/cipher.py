
from cryptography.hazmat.primitives.ciphers.aead import AESGCM
import os






def encrypt_data(plaintext: str) -> bytes:
    from Crypto.kdf_utils import get_key
    key = get_key()

    aesgcm = AESGCM(key)
    nonce = os.urandom(12)  # must be 12 bytes
    ciphertext = aesgcm.encrypt(nonce, plaintext.encode(), None)
    return nonce + ciphertext  # Store nonce + ciphertext together

def decrypt_data(data: bytes) -> str:
    from Crypto.kdf_utils import get_key
    key = get_key()
    aesgcm = AESGCM(key)
    nonce = data[:12]
    ciphertext = data[12:]
    return aesgcm.decrypt(nonce, ciphertext, None).decode()

