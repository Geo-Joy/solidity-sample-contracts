pragma solidity ^0.4.0;

contract concert {
    
    //creators address
    address owner;
    
    //number for concert tickets
    uint public tickets; 
    
    //unchangeble variable :) 
    uint public constant price = 1 ether; 
    
    //get a key value pair -> address vs number of tickets
    mapping (address => uint) public purchasers; 
    
    function concert(){
        owner = msg.sender; //contract creators address
        tickets = 5;  //max available tickets
    }
    
    function () payable{
        //default buy 1 ticket
        buyTickets(1);
    }
    
    function buyTickets(uint quantity) public payable{
        if( msg.value != ( quantity * price) || quantity > tickets ){
            revert();            
        }
        
        purchasers[msg.sender] += quantity;
        tickets -= quantity;
        
        //self destruct
        if(tickets == 0){
            selfdestruct(owner);
        }
    }
}
