//
//  Web3Manager.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import Foundation
import web3swift
import BigInt

final class Web3Manager {
    
    private static let web3 = Web3.InfuraRinkebyWeb3()
    
    static func importAccount(by privateKey: String, name: String) throws -> Web3Wallet {
        let password = "web3swift"
        let formattedKey = privateKey.trimmingCharacters(in: .whitespacesAndNewlines)
        let dataKey = Data.fromHex(formattedKey)!
        let keystore = try EthereumKeystoreV3(privateKey: dataKey, password: password)!
        let keyData = try JSONEncoder().encode(keystore.keystoreParams)
        let address = keystore.addresses!.first!.address
        return Web3Wallet(address: address, data: keyData, name: name, type: .normal)
    }
    
    static func getETHBalance(for wallet: Web3Wallet) throws -> String {
        let walletAddress = EthereumAddress(wallet.address)!
        let balanceResult = try web3.eth.getBalance(address: walletAddress)
        let balanceString = Web3.Utils.formatToEthereumUnits(balanceResult, toUnits: .eth, decimals: 3)!
        return balanceString
    }
    
    static func getXRTBalance(for wallet: Web3Wallet) throws -> String {
        let walletAddress = EthereumAddress(wallet.address)! // Your wallet address
        let exploredAddress = EthereumAddress(wallet.address)! // Address which balance we want to know. Here we used same wallet address
        let erc20ContractAddress = EthereumAddress(MyContsants.XRTToken.address)!
        let contract = web3.contract(Web3.Utils.erc20ABI, at: erc20ContractAddress, abiVersion: 2)!
        var options = TransactionOptions.defaultOptions
        options.from = walletAddress
        options.gasPrice = .automatic
        options.gasLimit = .automatic
        let method = "balanceOf"
        let tx = contract.read(
            method,
            parameters: [exploredAddress] as [AnyObject],
            extraData: Data(),
            transactionOptions: options)!
        let tokenBalance = try tx.call()
        let balanceBigUInt = tokenBalance["0"] as! BigUInt
        let balanceString = Web3.Utils.formatToEthereumUnits(balanceBigUInt, toUnits: .eth, decimals: 3)!
        return balanceString
    }
    
    static func sendXRTToken(amount: String, from wallet: Web3Wallet, to address: String) throws {
        let walletAddress = EthereumAddress(wallet.address)! // Your wallet address
        let toAddress = EthereumAddress(address)!
        let erc20ContractAddress = EthereumAddress(MyContsants.XRTToken.address)!
        let contract = web3.contract(Web3.Utils.erc20ABI, at: erc20ContractAddress, abiVersion: 2)!
        let amount = Web3.Utils.parseToBigUInt(amount, units: .eth)
        var options = TransactionOptions.defaultOptions
        options.value = amount
        options.from = walletAddress
        options.gasPrice = .automatic
        options.gasLimit = .automatic
        let method = "transfer"
        let tx = contract.write(
                method,
                parameters: [toAddress, amount] as [AnyObject],
                extraData: Data(),
                transactionOptions: options)!
    }
}
