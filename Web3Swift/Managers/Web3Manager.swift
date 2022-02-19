//
//  Web3Manager.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import Foundation
import BigInt
import FearlessUtils

final class Web3Manager {
    
    static let webSocketEngine = WebSocketEngine(url: URL(string: "wss://kusama.rpc.robonomics.network/")!)
    
    static func sendTransaction(from fromAddress: String = "0xE92A146f86fEda6D14Ee1dc1BfB620D3F3d1b873", to toAddress: String, amount: String) async throws -> String {
        
        webSocketEngine.connectIfNeeded()
        
    }
    
    
    static func getBalance(for address: String = "0xE92A146f86fEda6D14Ee1dc1BfB620D3F3d1b873") async throws -> String {
     return ""
    }
}
