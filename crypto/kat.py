# NEVER USE ECB is not secure

from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
import os

nist_kats = [
('f34481ec3cc627bacd5dc3fb08f273e6'),
('0336763e966d92595a567cc9ce537f5e'),
('9798c4640bad75c7c3227db910174e72',
('a9a1631bf4996954ebc093957b234589'),
('96ab5c2ff612d9dfaae8c31f30c42168'),
('ff4f8391a6a40ca5b25d23bedd44a597'),
('6a118a874519e64e9963798a503f1d35'),
('dc43be40be0e53712f7e2bf5ca707209')
]

key = os.urandom(16) # 16 bytes -> 128 bits: AES-128

aesCipher = Cipher(algorithms.AES(key),modes.ECB(), backend=default_backend())

aesEncryptor = aesCipher.encryptor()
aesDecryptor = aesCipher.decryptor()
