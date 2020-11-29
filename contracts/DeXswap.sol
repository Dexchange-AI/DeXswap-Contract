// SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

import "./IERC20.sol";

/// @author Laxman Rai
contract DeXswap{
    /// @dev amount of token to be locked
    uint256 public remainedToken = 29000000000000000000000;
    
    /// @dev contract address of DXC Token
    IERC20 public DXCToken = IERC20(0xa42eEC7BA2D195D923840aDB68819eDbE93459ec);
    
    /// @dev owner wallet address where eth and token are stored
    address payable public dxcOwner = 0x78D2DEc555571Eeb49714300cD3E6f7cAde39284;
    
    modifier checkTokenLocked(uint256 _dxcAmount){
        /// @dev non-negative token
        require(remainedToken > _dxcAmount, "Amount request exceeded!");
        
        uint256 _tempResult = remainedToken - _dxcAmount;
        
        /// @dev check if the token is locked or not
        require(remainedToken >= 15000000000000000000000 && _tempResult >= 15000000000000000000000, "Token has been locked!");
        _;
    }
    
    function swap(uint256 _dxcAmount) payable public checkTokenLocked(_dxcAmount) returns (string memory) {
        remainedToken -= _dxcAmount;
        
        /// @dev transfer the eth to owner first
        dxcOwner.transfer(msg.value);
        
        DXCToken.transferFrom(dxcOwner, msg.sender, _dxcAmount);
        
        /// @dev return success message
        return "Token swapped successfully!";
    }
}