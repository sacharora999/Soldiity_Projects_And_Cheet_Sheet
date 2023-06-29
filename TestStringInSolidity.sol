// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract TestStringInSolidity
{
    string public myStr = "Hello World";

    function setMyStr(string memory _myStr) public 
    {
        myStr = _myStr;
    }

    function compareTwoStrings(string memory _myStr) public view returns(bool)
    {
        return keccak256(abi.encodePacked(myStr)) == keccak256(abi.encodePacked(_myStr));
    }
}