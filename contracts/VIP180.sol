pragma solidity ^0.4.24;


/**
 * @title VIP180 interface
 * @dev see https://github.com/vechain/VIPs/blob/master/VIP-180-EN.md
 */
contract VIP180 {
    function name() public view returns(string);
    function symbol() public view returns(string);
    function decimals() public view returns(uint8);
    function totalSupply() public view returns(uint256);
    function balanceOf(address _owner) public view returns(uint256);
    function allowance(address _owner, address _spender) public view returns(uint256);

    function transfer(address _to, uint256 _value) public;
    function approve(address _spender, uint256 _value) public;
    function transferFrom(address _from, address _to, uint256 _value) public;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
