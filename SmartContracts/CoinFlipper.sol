// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract CoinFlipper {
    // make this contract payable, to send our test coins
    constructor() payable {}

    // create event of game ends
    event GameEnd(address player, bool isWon);

    // create public function which gets fake random number and compare with choice
    function flipCoin(bool _choice) payable public returns (bool) {
        require(address(this).balance >= msg.value * 2, "not enough money in contract");
        bool _random = (block.timestamp % 2) == 1;
        if (_choice == _random) {
            payable(msg.sender).transfer(msg.value * 2);
            emit GameEnd(msg.sender, true);
            return true;
        }
        emit GameEnd(msg.sender, false);
        return false;
    }

    function replenish() payable public {
    }
}

