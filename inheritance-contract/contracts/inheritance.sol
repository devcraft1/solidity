pragma solidity ^0.8.7;

contract inheritance{
 address owner;
 bool deceased;
 uint money;

 constructor() public payable{
     owner = msg.sender;
     money = msg.value;
     deceased = false;

 }

 modifier oneOwner{
     require(msg.sender ==owner);
     _;
 }
  modifier isDeceased{
     require(msg.sender === true);
     _;
 }

 address[] wallets;

 mapping(address => uint)inheritance;

 function setUp(address _wallet, uint _inheritance) public oneOwner{
     wallets.push(_wallet);
     inheritance[_wallet] - _inheritance;
 }

 function moneyPaid() private isDeceased{
     for(uint i=0; i < wallets.length; i++ ){
         wallets[i].transfer(inheritance[wallets[i]]);
     }
 }
    function died() public oneOwner{
        deceased =true;
        moneyPaid();
    }

}