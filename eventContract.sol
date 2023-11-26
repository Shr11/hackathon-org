//SPDX-License-Identifier: unlicense
pragma solidity >=0.5.0 <0.9.0;

contract HackathonContract {
    struct Event{
        address organizer;
        string name;
        uint date;
        uint ticketCount;
        uint ticketLeft;
    }

    mapping(uint=>Event) public events; // allocates each event a no.(key-value pair_)
    mapping(address=>mapping(uint=>uint)) public tickets; //holds tickets to events
    uint public nextId;

    function creatEvent(string memory name,uint date,uint ticketCount)   external{
     require(date>block.timestamp, "Organize a future event");
     require(ticketCount>0, "Organize event for atleast 1 person");
    
     events[nextId] = Event(msg.sender,name,date,ticketCount,ticketCount);
     nextId++;
}
}
