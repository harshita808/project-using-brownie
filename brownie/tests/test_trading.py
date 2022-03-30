from pickletools import uint1
from eth_typing import Address
import pytest
from brownie import trading, accounts


@pytest.fixture
def contract(scope="module"):
    return trading.deploy({"from":accounts[0]})

def test_merchant_getter(contract):
    assert contract.merchant() == accounts[0]


def test_pay(self,contract):
    contract.pay(self.accounts[0],500,{'from':self.accounts[1]})
    
    assert contract.balanceOf(accounts[1])==0
   