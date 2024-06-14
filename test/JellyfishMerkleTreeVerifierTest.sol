// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.26;

import "src/JellyfishMerkleTreeVerifier.sol";
import "forge-std/Test.sol";

contract JellyfishMerkleTreeVerifierTest is Test {

}

contract JellyfishMerkleTreeVerifierUser {
    using JellyfishMerkleTreeVerifier for bytes32;

    function verifyProof(bytes32 root, JellyfishMerkleTreeVerifier.Leaf calldata leaf, JellyfishMerkleTreeVerifier.Proof calldata proof) public pure returns (bool) {
        return root.verifyProof(leaf, proof);
    }
}
