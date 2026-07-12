import struct

with open("data/bunny.obj.bin", "rb") as f:
    b = f.read()

for i in range(4):
    print(struct.unpack("3f", b[i * 12:(i + 1) * 12]))

