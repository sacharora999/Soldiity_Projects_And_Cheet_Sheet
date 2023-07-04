// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract WillThrow 
{
    error ThisIsACustomError(string);
    function aFunction() public pure 
    {
        
        require(false, "Error message");
        assert(false);
        revert ThisIsACustomError("You are NOT allowed");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowleveldata);

    function catchError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            //here we could do something if it works
        }  catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
        catch Panic(uint errorCode) {
            emit ErrorLogCode(errorCode);
        }
        catch (bytes memory lowleveldata) {
            emit ErrorLogBytes(lowleveldata);
        }
    }
}
