pragma solidity ^0.5.0;

contract tokens { 
  uint8  public numCoinTypes = 3;

  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
  );

  mapping (uint => mapping (address => uint)) balanceOf;
  event Transfer(uint coinType, address sender, address receiver, uint amount);

  function token(uint numCoinTypes, uint totalSupply) {
    for (uint k=0; k<numCoinTypes; ++k) {
      balanceOf[k][msg.sender] = totalSupply;
    }
  }

  function transfer(uint coinType, address receiver, uint amount) returns(bool sufficient) {
    if (balanceOf[coinType][msg.sender] < amount) return false;
    balanceOf[coinType][msg.sender] -= amount;
    balanceOf[coinType][receiver] += amount;
    emit Transfer(coinType, msg.sender, receiver, amount);
    return true;
  }
}