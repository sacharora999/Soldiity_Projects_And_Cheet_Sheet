// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract MappingStructExample
{

    struct Transaction
    {
        uint amount;
        uint timestamp;
    }
    
    struct Balance
    {   
        uint totalBalance;
        uint numDeposit;
        mapping(uint => Transaction) deposits;
        uint numWithdrawls;
        mapping(uint => Transaction) withdrawls;
    } 

    mapping(address => Balance) public balances;
    function getDepositNumber(address _from, uint _numDeposit) public view returns(Transaction memory) 
    {
        return balances[_from].deposits[_numDeposit] ;
    }

    function depositMoney() public payable
    {
        balances[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numDeposit] = deposit;
        balances[msg.sender].numDeposit ++;
    }

    function withdrawMoney(address payable _to,uint _amt) public 
    {
        balances[msg.sender].totalBalance -= _amt;
        Transaction memory withdraw = Transaction(_amt, block.timestamp);
        balances[msg.sender].withdrawls[balances[msg.sender].numWithdrawls] = withdraw;
        balances[msg.sender].numWithdrawls ++;
        _to.transfer(_amt);
    }
}