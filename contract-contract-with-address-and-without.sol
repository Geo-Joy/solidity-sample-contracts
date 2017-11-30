pragma solidity ^0.4.0;

contract foo{
    //Calculator calc = new Calculator();
    Calculator calc = Calculator(0xc5266ca19406253bd9659c5689cc6dfcfd4633a8);
    
    function twoTImesThree() constant returns(int){
        return calc.multiply(2,3);
    }
    
    function onePlusSeven() constant returns(int){
        return calc.add(1,7);
    }
}

contract Calculator{
    function add(int a, int b) constant public returns(int){
        return a + b;
    }
    
    function multiply(int a, int b) constant public returns(int){
        return a * b;
    }
}
