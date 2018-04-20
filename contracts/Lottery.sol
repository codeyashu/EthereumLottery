// Lottery smart contract

pragma solidity ^0.4.22;

contract Lottery {
    address public manager;
    address[] public players;
    
    // msg object -- global variable include .data .gas .sender .value
    // created automatically when transaction is initiated or function call
    constructor() public {
         manager = msg.sender;
    }
    
    // require -- global variable // some requirement must be satisfied
    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }
    
    function getPlayers() public view returns (address[]) {
        return players;
    }
    
    // Can have more variables to make it difficult to predict
    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));        
    }
    
    function pickWinner() public restricted {
        uint index = random() % players.length;
        players[index].transfer((address(this)).balance);
        players = new address[](0);
    }

    // modifiers can be used to make the code cleaner
    modifier restricted(){
        require(msg.sender == manager);
        _;
    }
}