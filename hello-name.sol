pragma solidity ^0.4.0;

contract Hello {
    string name;
    
    function Hello() public{
        name = "Geo";
    }
    
    function sayHello() public constant returns(string, string) {
        return("Hello", name);
    }
    
    function setName(string newName) public{
        name = newName;
    }
}
