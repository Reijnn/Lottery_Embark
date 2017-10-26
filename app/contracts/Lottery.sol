pragma solidity ^0.4.17;

contract Lottery {
  
  struct Team {
      uint timestamp;
      string teamName;
  }
  
  uint numberTeams;
  address owner;
  
  mapping (uint => Team) teams;

  function Lottery() public {
   owner = msg.sender;
  }
  
  function newTeam(string name) {
      teams[numberTeams].timestamp = now;
      teams[numberTeams].teamName = name;
      numberTeams++;
  }
  
  function endLottery() public view returns (string name) {
      require(owner == msg.sender);
      uint winningNumber = uint(block.blockhash(block.number-1)) % numberTeams + 1;
      name = teams[winningNumber].teamName;
  }

  function end() public view returns (uint winner) {
    require(owner == msg.sender);
    winner = uint(block.blockhash(block.number-1)) % numberTeams + 1;
  }

  function reset() {
    require(owner == msg.sender);
    selfdestruct(msg.sender);
  }
  
  function getTeam(uint id) public view returns (string name, uint timestamp) {
      require(id < numberTeams);
      name = teams[id].teamName;
      timestamp = teams[id].timestamp;
  }

  function getNumberTeams() constant returns (uint amount) {
    return numberTeams;
  }

}