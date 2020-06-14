pragma solidity ^0.6.0;

contract StartingStopingPausingInformation{
    address owner;
    bool public paused;
   
    constructor() public{
        owner == msg.sender;
    }
    
    function sendMoney() public payable{
        
    }
    
    function setPaused(bool _paused) public{
        require(msg.sender == owner, "you are not the owner");
        paused = _paused;
    }
    
    function withdrawAllMoney(address payable _to) public{
        require(msg.sender == owner, "you can not withdraw!");
        require(!paused, "contract paused currently");
        _to.transfer(address(this).balance);
    }
    
    function destroySmartContract(address payable _to) public{
        require(msg.sender == owner, "you are not the owner");
        selfdestruct(_to);
    }
}
