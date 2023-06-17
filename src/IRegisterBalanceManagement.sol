// SPDX-License-Identifier: Apache-2.0

pragma solidity >=0.8.17;

interface OppenZeppelin_IERC20Snapshot {
  /**
    * @dev Emitted by {_snapshot} when a snapshot identified by `id` is created.
  */
  event Snapshot(uint256 id);
  function balanceOfAt(address account, uint256 snapshotId) external view returns (uint256);
  function totalSupplyAt(uint256 snapshotId) external view returns (uint256);
}

interface IRegisterBalanceManagement is OppenZeppelin_IERC20Snapshot {
  event SnapshotTimestampChange(uint256 indexed couponDate, uint256 indexed currentTimestamp, uint256 indexed nextTimestamp);
  
  function currentSnapshotDatetime() external view returns (uint256);
  function nextSnapshotDatetime() external view returns (uint256);
  function currentCouponDate() external view returns (uint256);

  // Defines when the next snapshot should be taken. Called by satellite smart contract
  // This sets a timestamp at couponDate + cutOffTime that get tested during a transfer to decide if a snapshot should be taken before updating the balance
  function setCurrentCouponDate(uint256 couponDate, uint256 cutOffTime) external;

  // current balance of the given investor's account at the specific coupon date in the past
  function balanceOfCoupon(address investor, uint256 couponDate) external;

  // mint the expected supply to the technical wallet and change state from Draft to Ready (for issuance)
  function makeReady() external;

  // execute a transfer of the total balance of the investor to the technical wallet to perform the redemption to be called by satellite smart contracts
  function returnBalanceToPrimaryIssuanceAccount(address investor) external returns (bool);
}