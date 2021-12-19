//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract arrayWithUniqueIds {

    struct EntityStruct {
        address entityAddress;
        uint entityData;
    }
    
    EntityStruct[] public entityStructs;

    mapping (address => bool) public knownEntity;

    function isEntity(address entityAddress) public view returns (bool isIndeed) {
        return knownEntity[entityAddress];

    }

//NAME VAR'S WITH UNDERSCORE AND ASSIGN ALL IN ONE SHOT...
//HERE WE RETURN ENTITYSTRUCT MEMORY 
//     function addEntity (address _entityAddress, uint _entityData) public returns (EntityStruct memory) {
//          if(isEntity(_entityAddress)) revert();
//          EntityStruct memory newEntity = EntityStruct (_entityAddress, _entityData);
//          entityStructs.push(newEntity);
//          knownEntity[entityAddress] = true;
//          return entityStructs[entityStructs.length - 1];
//     }
// 

//NAME VAR'S SAME AND ASSIGN EACH PROPERTY SEPERATELY
//HERE WE RETURN ENTITYSTRUCT MEMORY 
    // function addEntity(address entityAddress, uint entityData) public returns(EntityStruct memory) {
    //     if(isEntity(entityAddress)) revert();
    //     EntityStruct memory newEntity;
    //     newEntity.entityAddress = entityAddress;
    //     newEntity.entityData = entityData;
    //     entityStructs.push(newEntity);
    //     knownEntity[entityAddress] = true;
    //     return entityStructs[entityStructs.length - 1];
    // }

//SAME AS ABOVE BUT HERE WE RETURN uint RowNumber instead 
    function addEntity(address entityAddress, uint entityData) public returns (uint rowNumber) {
        if(isEntity(entityAddress)) revert ();
        EntityStruct memory newEntity;
        newEntity.entityAddress = entityAddress;
        newEntity.entityData = entityData;
        entityStructs.push(newEntity);
        knownEntity[entityAddress] = true;
        return entityStructs.length - 1;
    }

    function getEntityCount() public view returns (uint entityCount) {
        return entityStructs.length;
    }

    function getEntityArray() public view returns (EntityStruct[] memory) {
        return entityStructs;
    }

    function getEntity(uint _index) public view returns (address, uint) {
        return(entityStructs[_index].entityAddress, entityStructs[_index].entityData);
    }

    function updateEntity(uint rowNumber, address entityAddress, uint entityData) public returns (bool success) {
        if(!isEntity(entityAddress)) revert();
        if(entityStructs[rowNumber].entityAddress != entityAddress)
        entityStructs[rowNumber].entityData = entityData;
        return true;
    }

}

