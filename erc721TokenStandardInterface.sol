// SPDX-License-Identifier: (c) Copyright 2020 Kingsland University, All Rights Reserved.

contract ERC721 {
function balanceOf(address _owner) → uint
function ownerOf(uint _tokenId) → address
function transferFrom(address _from, address _to, uint _tokenId)
function safeTransferFrom(address _from, address _to, uint _tokenId)
function approve(address _spender, uint _tokenId)
function getApproved(uint _tokenId) → address
function setApprovalForAll(address _opereator, bool _approved)
function isApprovedForAll(address _owner, address _operator) → bool
event Transfer(address _from, address _to, uint _value)
event Approval(address _owner, address _spender, uint _value)
event ApprovalForAll(address _owner, address _operator, bool _approved)
}