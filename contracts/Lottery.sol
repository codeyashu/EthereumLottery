pragma solidity ^0.4.17;

// msg object -- global variable include .data .gas .sender .value ; created automatically when transaction is initiated or function call
// require -- global variable // some requirement must be satisfied
// sha3, keccak256 -- global function;  now-- current time

contract Lottery {
    address public manager;
    address[] public players;
    
    function Lottery() public {
         manager = msg.sender;
    }
    
    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }
    
    function getPlayers() public view returns (address[]){
        return players;
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));        
    }
    
    function pickWinner() public restricted {
        uint index = random() % players.length;
        players[index].transfer(this.balance);
        players = new address[](0);
    }

    modifier restricted(){
        require(msg.sender == manager);
        _;
    }
}