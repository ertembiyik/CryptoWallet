//
//  Transaction.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 18.02.2022.
//

import web3
import BigInt

struct Transfer: ABIFunction {
    public static let name = "transfer"
    public let gasPrice: BigUInt? = nil
    public let gasLimit: BigUInt? = nil
    public var contract: EthereumAddress
    public let from: EthereumAddress?

    public let to: EthereumAddress
    public let value: BigUInt

    public init(contract: EthereumAddress,
                from: EthereumAddress? = nil,
                to: EthereumAddress,
                value: BigUInt) {
        self.contract = contract
        self.from = from
        self.to = to
        self.value = value
    }

    public func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(to)
        try encoder.encode(value)
    }
}
