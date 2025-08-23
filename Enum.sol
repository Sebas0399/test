// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Enum {
   enum State{
        CREATED, //0
        PAID, //1
        SHIPPED, //2 
        DELIVERED,  //3 
        CANCELED    //4
   }
   State public state;
   //get
   function get() public  view returns (State){
        return state;
   }
   //set
   function set(State _state) public {
        state = _state;
   }
    function cancel()public {
        state =State.CANCELED;
    }
    function reset() public {
        delete state;
    }
}
