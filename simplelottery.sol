// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract simplelottery{
    address[]  participants;
    address []a;
    address manager;
    uint winner;
    uint lottery_status;
    event startlottery(address winner);
    
    constructor(){
      manager=msg.sender;
      lottery_status=0;
      
      
    }
    receive() external payable {}
    function join_to_lottery()payable public{
        require(msg.value >= 1,"please send 1 eth to join the lottery");
        participants.push(msg.sender);
    }
    function view_participants() public view returns(address[] memory ){
        return participants;
        }
    function start_lottery()public{
        require(msg.sender==manager,"Manager can only start the lottery");
        require(participants.length > 3,"not enough participants");
        
        winner= uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, participants.length))) % participants.length;
        lottery_status=1;
        if (lottery_status==1)
        payable(participants[winner]).transfer(address(this).balance);
        emit startlottery(participants[winner]);
        
    }
    //deployed on 0xbf2a0AC8f796665D40b8765B1960f79F86Cc61D8
 
        
            
        
    
}
