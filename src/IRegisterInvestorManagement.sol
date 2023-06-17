// SPDX-License-Identifier: Apache-2.0

pragma solidity >=0.8.17;

interface IRegisterInvestorManagement {

  event EnableInvestor(address investor);
  event DisableInvestor(address investor);

  // allow and remove investor wallet in/from the list of allowed wallets (form of KYC status and sancionned party)
  function enableInvestorToWhitelist(address investor) external;
  function disableInvestorFromWhitelist(address investor) external; 
  function investorsAllowed(address investor) external view returns (bool);
  function getAllInvestors() external view returns (address[] memory);
  function investorCustodian(address investor) external view returns (address);

}