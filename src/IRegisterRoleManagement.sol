// SPDX-License-Identifier: Apache-2.0

pragma solidity >=0.8.17;

import "@openzeppelin/contracts/access/IAccessControl.sol";
interface IRegisterRoleManagement is IAccessControl {
  // control the master admin role. requires 2 different registrar wallet to effect the change
  function changeAdminRole(address account) external; 
}