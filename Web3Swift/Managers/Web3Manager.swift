//
//  Web3Manager.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import Foundation
import web3
import BigInt
import UIKit

final class Web3Manager {
    
    private static let clientUrl = URL(string: "https://sokol.poa.network")!
    private static let client = EthereumClient(url: clientUrl)
    
    private static let keyStorage = EthereumKeyLocalStorage()
    
  
    private static let etheriumAccount = try! EthereumAccount.importAccount(
                keyStorage: Web3Manager.keyStorage,
                privateKey: "2404a482a212386ecf1ed054547cf4d28348ddf73d23325a83373f803138f105",
                keystorePassword: "hello")
        
    
    static func sendTransaction(from fromAddress: String = "0xE92A146f86fEda6D14Ee1dc1BfB620D3F3d1b873", to toAddress: String, amount: String) async throws -> String {
        
        let function = Transfer(contract: EthereumAddress("0x29df02D4425A86a29636CF770a50335e7857a4B0"),
                                from: EthereumAddress(fromAddress),
                                to: EthereumAddress(toAddress),
                                value: BigUInt(Double(amount)!))
        
        let transaction = try function.transaction(gasPrice: BigUInt(10000000000), gasLimit: BigUInt(300000))
        
        do {
            let hashValue = try await Web3Manager.client.eth_sendRawTransaction(transaction, withAccount: Web3Manager.etheriumAccount)
            return hashValue
        } catch {
            throw error
        }
        
    }
    
    
    static func getBalance(for address: String = "0xE92A146f86fEda6D14Ee1dc1BfB620D3F3d1b873") async throws -> String {
        do {
            let token = ERC20(client: client)
            
            let balance = try await token.balanceOf(tokenContract: EthereumAddress("0x29df02D4425A86a29636CF770a50335e7857a4B0"), address: EthereumAddress(address))
            return String(balance)
        } catch {
            throw error
        }
    }
}
