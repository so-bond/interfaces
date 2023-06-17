// SPDX-License-Identifier: Apache-2.0

pragma solidity >=0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./IRegisterBalanceManagement.sol";
import "./IRegisterRoleManagement.sol";
import "./IRegisterSatelliteManagement.sol";
import "./IRegisterInvestorManagement.sol";
import "./IRegisterTS.sol";

interface IRegister is
  IRegisterBalanceManagement, 
  IRegisterRoleManagement, 
  IRegisterSatelliteManagement, 
  IRegisterInvestorManagement,
  IRegisterTS, 
  IERC20 {

    event PublicMessage(address indexed sender, address indexed target, string message);

}