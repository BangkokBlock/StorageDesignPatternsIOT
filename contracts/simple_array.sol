pragma solidity ^0.8.10;

contract simpleList {

    struct EntityStruct {
        address entityAddress;
        uint entityData;
    }
    
    EntityStruct[] public entityStructs;

    function addEntity (address _entityAddress, uint _entityData) public returns (EntityStruct memory) {
        EntityStruct memory newEntity = EntityStruct (_entityAddress, _entityData);
        entityStructs.push(newEntity);
        return entityStructs[entityStructs.length - 1];
    }
    function getEntityCount() public view returns (uint) {
        return entityStructs.length; 
    }

    function getEntityArray() public view returns (EntityStruct[] memory) {
        return entityStructs;
    }
    
    function getEntity(uint _index) public view returns (address, uint) {
        return (entityStructs[_index].entityAddress, entityStructs[_index].entityData);
    }
}
    
    