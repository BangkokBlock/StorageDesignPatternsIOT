//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mappedWithUnorderedIndexAndDelete {

    struct EntityStruct {
        uint entityData;
        uint listPointer;
    }
    
    address[] public entityList;
    mapping(address => EntityStruct) public entityStructs;
    
    function isEntity (address entityAddress) public view returns (bool isIndeed) {
        if(entityList.length == 0) return false;
        return (entityList[entityStructs[entityAddress].listPointer] == entityAddress);
    }

    function newEntity (address entityAddress, uint entityData) public returns (bool success) {
        if(isEntity(entityAddress)) revert();
        entityStructs[entityAddress].entityData = entityData;
        entityStructs[entityAddress].listPointer = entityList.length - 1;
        entityList.push(entityAddress);
        return true;
    }

    function getEntityCount() public view returns (uint entityCount) {
        return entityList.length;
    }

    function updateEntity (address entityAddress, uint entityData) public returns (bool success) {
        if(!isEntity(entityAddress)) revert();
        entityStructs[entityAddress].entityData = entityData;
        return true;
    }
    
    function deleteEntity (address entityAddress) public returns (bool success) {
        if(!isEntity(entityAddress)) revert();
        uint rowToDelete = entityStructs[entityAddress].listPointer;
        address keyToMove = entityList[entityList.length - 1];
        entityList[rowToDelete] = keyToMove;
        entityStructs[keyToMove].listPointer = rowToDelete;
        entityList.pop();
        delete entityStructs[entityAddress];
        return true;
    }
}