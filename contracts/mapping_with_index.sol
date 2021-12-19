//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mappedStructsWithIndex {

    struct EntityStruct {
        uint entityData;
        bool isEntity;
    }

    address[] public entityList;
    mapping (address => EntityStruct) public entityStructs;

    function isEntity(address entityAddress) public view returns (bool isIndeed) {
        return entityStructs[entityAddress].isEntity;
    }

    function newEntity(address entityAddress, uint entityData) public returns (uint rowNumber) {
        if(isEntity(entityAddress)) revert();
        entityStructs[entityAddress].entityData = entityData;
        entityStructs[entityAddress].isEntity = true;
        entityList.push(entityAddress);
        return entityList.length-1;
    }

    function updateEntity(address entityAddress, uint entityData) public returns (bool success) {
        if(!isEntity(entityAddress)) revert();
        entityStructs[entityAddress].entityData = entityData;
        return true;
    }

    function getEntityCount() public view returns (uint entityCount) {
        return entityList.length;
    }

}