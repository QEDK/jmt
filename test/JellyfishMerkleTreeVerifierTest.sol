// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.26;

import "src/JellyfishMerkleTreeVerifier.sol";
import "forge-std/Test.sol";

contract JellyfishMerkleTreeVerifierTest is Test {
    JellyfishMerkleTreeVerifierUser jmtUser;

    function setUp() external {
        jmtUser = new JellyfishMerkleTreeVerifierUser();
    }

    function test_verifyProof() public view {
        JellyfishMerkleTreeVerifier.Leaf memory leaf = JellyfishMerkleTreeVerifier.Leaf({
            addr: 0x0101010101010101010101010101010101010101010101010101010101010101,
            valueHash: 0xa665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3
        });
        bytes32[] memory siblings = new bytes32[](7);
        siblings[0] = 0xd7f314b6ee65a14ca2805610debeac9f93d03386fb08e14f95beb1fb4bef03ac;
        siblings[1] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        siblings[2] = 0x9c1e1bce27a649373c74d44e7e97c1d269b586631d0d31ef63813447d721fb58;
        siblings[3] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        siblings[4] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        siblings[5] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        siblings[6] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        JellyfishMerkleTreeVerifier.Proof memory proof = JellyfishMerkleTreeVerifier.Proof({
            leaf: JellyfishMerkleTreeVerifier.Leaf({
                addr: 0x0101010101010101010101010101010101010101010101010101010101010101,
                valueHash: 0xa665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3
            }),
            siblings: siblings
        });
        assertTrue(jmtUser.verifyProof(0x7be2a40f7a47936cf2b398ebc5cabbfc8019ecb458be5dd8a5473b2dad1fbe2e, leaf, proof));
    }
}

contract JellyfishMerkleTreeVerifierUser {
    using JellyfishMerkleTreeVerifier for bytes32;

    function verifyProof(bytes32 root, JellyfishMerkleTreeVerifier.Leaf calldata leaf, JellyfishMerkleTreeVerifier.Proof calldata proof) public view returns (bool) {
        return root.verifyProof(leaf, proof);
    }
}
