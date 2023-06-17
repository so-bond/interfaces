// SPDX-License-Identifier: Apache-2.0

pragma solidity >=0.8.17;
interface IRegisterSatelliteManagement {
  // access to the status of the satellite smart contract by its hash
  function _contractsAllowed(bytes32) external view returns(bool);

  event EnableContract(bytes32 contractHash);
  event DisableContract(bytes32 contractHash);

  // allow any smart contract with the provided runtime code hash. Attention code hash does not cover the smart contract constructor
  function enableContractToWhitelist(bytes32 contractHash) external; 
  // disable a previously enabled runtime code hash
  function disableContractFromWhitelist(bytes32 contractHash) external; 
  // return true if the caller is a smart contract that was whitelisted
  function isCallerApprovedSmartContract() external view returns(bool);

  // return the hash of the runtime code of the smart contract
  function atReturningHash(address _contract) external view returns(bytes32);
}