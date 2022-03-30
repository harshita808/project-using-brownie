//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;
contract trading{
    address  payable public merchant;
    address public buyer;
    uint public price;

    constructor() {
        merchant=payable(msg.sender);
    }

    modifier onlyMerchant(){   
        require(msg.sender==merchant,"Only merchant can call this function");
        _;
    }
    function setPrice(uint _price) public onlyMerchant{
        price=_price;
        
    }
     function updatingPrice() public {
          
           price=price+tx.gasprice;
           
    }
   
   

 function pay()external payable{
    require(msg.value==price,"value not same");
    uint a=address(this).balance;
    a+=msg.value;
    buyer=msg.sender;
   
 }

function getBalance() public onlyMerchant view returns (uint){
        return address(this).balance;
    }
   
   function withdraw() public payable onlyMerchant {
       
        merchant.transfer(address(this).balance);
    }

}
    