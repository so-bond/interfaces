
// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.17;

interface IRegisterTS {
  enum Status {Draft, Ready, Issued, Repaid, Frozen}
  function status() external view returns (Status);
  // The event is used to quickly find existing bonds and their status history. It can replaced the Instrument Registry
  event RegisterStatusChanged( address indexed emiter, string name, string isin, Status status );
  // swich status from Issued to Frozen and vice versa
  function toggleFrozen() external;

  struct BondData {
      string name;
      string isin; // initialized by the contructor. Also set in the ERC20 symbol
      uint256 expectedSupply; // is the number of unit of bond - the minted amount - when Registrar calls makeReady()
      bytes3 currency; //currency as 3 characters ISO code 
      uint256 unitValue; //value of 1 unit of bond in currency
      uint256 couponRate; //percentage of interests per year (eg 0.25%).
      uint256 creationDate; //Actual date of creation 
      uint256 issuanceDate; //The actual date of issuance (when the bond start to exists legally speaking)
      uint256 maturityDate; //The expected date in the future for the repayment by the issuer - expected to be issuance date + N years
      uint256[] couponDates; //An array of dates, as anniversary dates of the issuance until maturity (excluded). 
      uint256 cutOffTime; //the time part of when snapshot must be recorded on coupon or maturity date (must be lower than 24*3600 sec)
  }
  function setIsinSymbol(string memory isinSymbol) external;
  function getBondData() external view returns (BondData memory);
  function setBondData(
      string memory name,
      uint256 expectedSupply,
      bytes3 currency,
      uint256 unitVal,
      uint256 couponRate,
      uint256 issuanceDate,
      uint256 maturityDate,
      uint256 cutOffTime
    ) external;
  function addCouponDate(uint256 date) external;
  function delCouponDate(uint256 date) external;

}