// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Degen is ERC20, Ownable {

    string[] public items_Name = ["1. Elite NFT", "2. Players Token", "3. Delta NFT", "4 . Beginner Tag"];

   constructor() ERC20("HRT-Degen", "DGN") Ownable(msg.sender) {}

    function Func_mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
  // To Transfer the tokens into another players address
    function Func_transferTo(address to, uint amount) public {
        require(balanceOf(msg.sender) >= amount, "Please mint some tokens");
        approve(msg.sender, amount);
        transferFrom(msg.sender, to, amount);
    }
   // To Redeem the items /NFTs
function Func_redeem(uint to_redeem) public returns(string memory) {
    require(balanceOf(msg.sender) >= 50, "Please mint some tokens");
    if(balanceOf(msg.sender) >= 112 && to_redeem == 808){
        _burn(msg.sender, 112);
        return items_Name[3];
    }
    else if(balanceOf(msg.sender) >= 105 && to_redeem == 202){
        _burn(msg.sender, 105);
        return items_Name[2];
    }
    else if(balanceOf(msg.sender) >= 150 && to_redeem == 303){
        _burn(msg.sender,150);
        return items_Name[1];
    }
    else if(balanceOf(msg.sender) >= 110 && to_redeem == 905){
        _burn(msg.sender, 110);
        return items_Name[0];
    }
    else {
        return "You need a Valid redeemption code";
    }
} 
    function Func_viewBalance() public view returns(uint) {
        return balanceOf(msg.sender);
    }
   
    function Func_burn(uint amount) public {
        require(balanceOf(msg.sender) >= amount, "Please mint some tokens");
        _burn(msg.sender, amount);
    }
    
}
