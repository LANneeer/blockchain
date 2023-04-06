// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Sign {
    struct Signer {
        bool canSign;
        bool hasSign;
    }
    struct Document {
        string title;
        string description;
        uint256 signsCount;
    }
    
    Document public document;

    mapping(address => Signer) signers;

    constructor(string memory _docTitle, string memory _docDesc) {
        document.title = _docTitle;
        document.description = _docDesc;
        document.signsCount = 0;
    }


    function sign() public {
        require(signers[msg.sender].canSign, "You can't sign!");
        signers[msg.sender].canSign = false;
        signers[msg.sender].hasSign = true;
        document.signsCount += 1;
    }

    function checkSignsCount() public view returns (uint256) {
        return document.signsCount;
    }
}
