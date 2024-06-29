// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Ownership {
  address owner = msg.sender;

  modifier isOwner() {
    require(owner == msg.sender);
    _;
  }

  function Owner() public {
    owner = msg.sender;
  }

}

contract Pausable is Ownership {
    bool is_paused;

    function paused() public isOwner {
        is_paused = true;
    }

    function resume() public isOwner {
        is_paused = false;
    }

    modifier ifNotPaused() {
        require(is_paused == false);
        _;
    }
}

contract Token is Pausable {
    mapping(address => uint) public balances;

    function transfer(address to, uint value) ifNotPaused public {
        balances[msg.sender] -= value;
        balances[to] += value;
    }
}

