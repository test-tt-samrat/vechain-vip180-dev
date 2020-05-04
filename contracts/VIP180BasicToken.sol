pragma solidity ^0.4.24;

import "./VIP180.sol";
import "./SafeMath.sol";


contract BasicToken is VIP180 {
    using SafeMath for uint256;

    string public name;
    string public symbol;
    uint8 public decimals;

    uint256 public totalSupply;

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) internal allowed;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    /**
    * @dev Constructor that gives msg.sender all of existing tokens.
    */
    constructor(
        address _initialHolder,
        uint256 _initialSupply,
        string _name,
        string _symbol,
        uint8 _decimals
    )
        public
    {
        require(_initialHolder != address(0), "invalid address");

        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply;

        balances[_initialHolder] = _initialSupply;
        emit Transfer(address(0), _initialHolder, _initialSupply);
    }

    function name() public view returns(string){
        return name;
    }

    function symbol() public view returns(string){
        return symbol;
    }

    function decimals() public view returns(uint8){
        return decimals;
    }

    function totalSupply() public view returns(uint256){
        return totalSupply;
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param _owner The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address _owner)
        public
        view
        returns (uint256)
    {
        return balances[_owner];
    }

    /**
    * @dev Function to check the amount of tokens that an owner allowed to a spender.
    * @param _owner address The address which owns the funds.
    * @param _spender address The address which will spend the funds.
    * @return A uint256 specifying the amount of tokens still available for the spender.
    */
    function allowance(
        address _owner,
        address _spender
    )
        public
        view
        returns (uint256)
    {
        return allowed[_owner][_spender];
    }

    /**
    * @dev Transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value)
        public
    {
        require(_value <= balances[msg.sender], "insufficient balance");
        require(_to != address(0), "invalid target address");

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
    }

    /**
    * @dev Allows _spender to withdraw from your account multiple times, up to the _value amount, 
    *      and MUST emit the Approval event. If this function is called again it overwrites the 
    *      current allowance with _value.
    * @param _spender The address which will spend the funds.
    * @param _value The amount of tokens to be spent.
    */
    function approve(address _spender, uint256 _value)
        public
    {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
    }

    /**
    * @dev Transfer tokens from one address to another
    * @param _from address The address which you want to send tokens from
    * @param _to address The address which you want to transfer to
    * @param _value uint256 the amount of tokens to be transferred
    */
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
        public
    {
        require(_value <= balances[_from], "insufficient balance");
        require(_value <= allowed[_from][msg.sender], "exceed the allowed");
        require(_to != address(0), "invalid target address");

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
    }

}
