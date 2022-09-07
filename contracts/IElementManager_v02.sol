//SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

interface IElementManager 
{
    struct Element 
    {
        uint256 id;
        bool isClosable;
    }

    function elements(uint256 _index) external view returns (uint256 id, bool isClosable);

    function elementsId() external view returns (uint256);

    function elementsIndexes(uint256) external view returns (uint256);

    function sizeLimit() external view returns (uint256);

    function getElement(uint256 _id) external view returns (Element memory);

    function getAllElementsLength() external view returns (uint256);

    function getAllElements() external view returns (Element[] memory);

    function getElementsPage(uint256 cursor, uint256 count)external view returns (Element[] memory elementsPage, uint256 newCursor);

    function getClosableElements(uint256 _cursor, uint256 _count)external view returns (uint256 newCursor,bool closureNeeded,uint256[] memory ids);

    function closeElements() external returns(bool flag);
}
