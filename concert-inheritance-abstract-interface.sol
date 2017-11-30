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
    
    function concert( uint t) public{
        owner = msg.sender; //contract creators address
        tickets = t;  //max available tickets
    }
    
    function () payable public {
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
    function website() constant public returns(string);
}

interface Refundable{
    function refund(uint numTickets) public returns(bool);
}

contract attack is concert(10), Refundable{
    
    function refund(uint numTickets) public returns(bool){
        if( purchasers[msg.sender] < numTickets){
            return false;
        }
        
        msg.sender.transfer(numTickets * price);
        purchasers[msg.sender] -= numTickets;
        tickets += numTickets;
        return true;
    }
    
    
    function website() constant public returns(string){
        return "http://website.com";
    }
}
