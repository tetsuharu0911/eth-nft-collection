// MyEpicNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "hardhat/console.sol";
// いくつかのOpenZeppelinのコントラクトをインポートします。
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// utils ライブラリをインポートして文字列の処理を行います。
import "@openzeppelin/contracts/utils/Counters.sol";

import "hardhat/console.sol";

// インポートした OpenZeppelin のコントラクトを継承しています。
// 継承したコントラクトのメソッドにアクセスできるようになります。
contract MyEpicNFT is ERC721URIStorage {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract.");
    }

    function makeAnEpicNFT() public {

        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        _setTokenURI(
            newItemId,
            "data:application/json;base64,ewogICAgIm5hbWUiOiAiRXBpY05mdENyZWF0b3IiLAogICAgImRlc2NyaXB0aW9uIjogIlRoZSBoaWdobHkgYWNjbGFpbWVkIHNxdWFyZSBjb2xsZWN0aW9uIiwKICAgICJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJad29nSUhodGJHNXpQU0pvZEhSd09pOHZkM2QzTG5jekxtOXlaeTh5TURBd0wzTjJaeUlLSUNCd2NtVnpaWEoyWlVGemNHVmpkRkpoZEdsdlBTSjRUV2x1V1UxcGJpQnRaV1YwSWdvZ0lIWnBaWGRDYjNnOUlqQWdNQ0F6TlRBZ016VXdJZ28rQ2lBZ1BITjBlV3hsUGdvZ0lDQWdMbUpoYzJVZ2V3b2dJQ0FnSUNCbWFXeHNPaUIzYUdsMFpUc0tJQ0FnSUNBZ1ptOXVkQzFtWVcxcGJIazZJSE5sY21sbU93b2dJQ0FnSUNCbWIyNTBMWE5wZW1VNklERTBjSGc3Q2lBZ0lDQjlDaUFnUEM5emRIbHNaVDRLSUNBOGNtVmpkQ0IzYVdSMGFEMGlNVEF3SlNJZ2FHVnBaMmgwUFNJeE1EQWxJaUJtYVd4c1BTSmliR0ZqYXlJZ0x6NEtJQ0E4ZEdWNGRBb2dJQ0FnZUQwaU5UQWxJZ29nSUNBZ2VUMGlOVEFsSWdvZ0lDQWdZMnhoYzNNOUltSmhjMlVpQ2lBZ0lDQmtiMjFwYm1GdWRDMWlZWE5sYkdsdVpUMGliV2xrWkd4bElnb2dJQ0FnZEdWNGRDMWhibU5vYjNJOUltMXBaR1JzWlNJS0lDQStDaUFnSUNCRmNHbGpUbVowUTNKbFlYUnZjZ29nSUR3dmRHVjRkRDRLUEM5emRtYysiCiAgfQ=="
        );
        console.log("An NFT  w/ ID %s has been minted to %s", newItemId, msg.sender);
        _tokenIds.increment();
    }
}

// Alchemyテストネットアドレス https://eth-goerli.g.alchemy.com/v2/MuCmAHt_picWnTr1ni6AUbv7LJybLsNe

// data:application/json;base64,ewogICJuYW1lIjogIkVwaWNOZnRDcmVhdG9yIiwKICAiZGVzY3JpcHRpb24iOiAiVGhlIGhpZ2hseSBhY2NsYWltZWQgc3F1YXJlIGNvbGxlY3Rpb24iLAogICJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJad29nSUhodGJHNXpQU0pvZEhSd09pOHZkM2QzTG5jekxtOXlaeTh5TURBd0wzTjJaeUlLSUNCd2NtVnpaWEoyWlVGemNHVmpkRkpoZEdsdlBTSjRUV2x1V1UxcGJpQnRaV1YwSWdvZ0lIWnBaWGRDYjNnOUlqQWdNQ0F6TlRBZ016VXdJZ28rQ2lBZ1BITjBlV3hsUGdvZ0lDQWdMbUpoYzJVZ2V3b2dJQ0FnSUNCbWFXeHNPaUIzYUdsMFpUc0tJQ0FnSUNBZ1ptOXVkQzFtWVcxcGJIazZJSE5sY21sbU93b2dJQ0FnSUNCbWIyNTBMWE5wZW1VNklERTBjSGc3Q2lBZ0lDQjlDaUFnUEM5emRIbHNaVDRLSUNBOGNtVmpkQ0IzYVdSMGFEMGlNVEF3SlNJZ2FHVnBaMmgwUFNJeE1EQWxJaUJtYVd4c1BTSmliR0ZqYXlJZ0x6NEtJQ0E4ZEdWNGRBb2dJQ0FnZUQwaU5UQWxJZ29nSUNBZ2VUMGlOVEFsSWdvZ0lDQWdZMnhoYzNNOUltSmhjMlVpQ2lBZ0lDQmtiMjFwYm1GdWRDMWlZWE5sYkdsdVpUMGliV2xrWkd4bElnb2dJQ0FnZEdWNGRDMWhibU5vYjNJOUltMXBaR1JzWlNJS0lDQStDaUFnSUNCRmNHbGpUbVowUTNKbFlYUnZjZ29nSUR3dmRHVjRkRDRLUEM5emRtYysiCn0=
