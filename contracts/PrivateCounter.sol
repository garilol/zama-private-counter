// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {FHE, euint64, externalEuint64} from "@fhevm/solidity/lib/FHE.sol";
import {SepoliaFHEVMConfig}            from "@fhevm/solidity/config/FHEVMConfig.sol";

contract PrivateCounter is SepoliaFHEVMConfig {
    euint64 private _counter;

    constructor() {
        _counter = FHE.asEuint64(0);
    }

    function inc(externalEuint64 delta, bytes calldata proof) external {
        euint64 d = FHE.fromExternal(delta, proof);
        _counter  = FHE.add(_counter, d);
        FHE.allowOwner(_counter);
    }

    function get() external view returns (bytes memory) {
        return FHE.reencrypt(_counter, FHE.getPublicKey());
    }
}
