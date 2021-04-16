// SPDX-License-Identifier: MIT

pragma solidity =0.6.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


import "./Ownable.sol";


// SushiToken with Governance.
contract OFPI is Ownable, ERC20("Open Finance Project Delegator Insurance Contract", "OFPI"){

	address payable public validatorAddress = 0x0AB2FeBCEFD498758071f5Bd83dB5E1213272c41;
	uint lastWithdraw = 0;

	receive() external payable {
	     _mint(address(this), msg.value);
	}

	function withdraw(uint _amount) public onlyOwner{
		payable(address(validatorAddress)).transfer(_amount);
		_burn(address(this), _amount);
		lastWithdraw = now;
	}

	function getBalance() public view returns (uint) {
	    return address(this).balance;
	}




}