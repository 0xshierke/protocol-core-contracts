// SPDX-License-Identifier: butane
pragma solidity =0.8.17;

import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestWETH is ERC20, ERC20Burnable {
  event Deposit(address indexed dst, uint256 wad);
  event Withdrawal(address indexed src, uint256 wad);

  // solhint-disable-next-line no-empty-blocks
  constructor() ERC20("Test Wrapped ETH", "tWETH") {}

  // @inheritdoc IProxy
  // solhint-disable-next-line no-empty-blocks
  receive() external payable {
    deposit();
  }

  function withdraw(uint256 wad) external {
    _burn(msg.sender, wad);
    (bool success, ) = payable(msg.sender).call{value: wad}("");
    require(success, "Transfer failed.");


    emit Withdrawal(msg.sender, wad);
  }

  function mintAny(address to, uint256 amount) external {
    _mint(to, amount* (uint256(10) ** uint256(decimals())));
  }

  function deposit() public payable {
    _mint(msg.sender, msg.value);

    emit Deposit(msg.sender, msg.value);
  }
}