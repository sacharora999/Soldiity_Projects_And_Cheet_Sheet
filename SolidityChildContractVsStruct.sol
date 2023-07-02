// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}

contract Wallet {
    PaymentReceived public payment;

    function payContract() public payable {
        payment = new PaymentReceived(msg.sender, msg.value);
    }
}


contract Wallet2 {
    struct pmtReceived 
    {
        address from;
        uint amount;
    }
    pmtReceived public pmtn;

    function payContract() public payable {
        pmtn =  pmtReceived(msg.sender, msg.value);
    }
}