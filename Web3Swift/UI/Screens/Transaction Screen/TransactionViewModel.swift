//
//  TransactionViewModel.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import SwiftUI

final class TransactionViewModel: ObservableObject {
    @Published var sendingAmount: String = "12"
    @Published var sendingAddress: String = "0x97369cc8bf2E6d18351BB79BE10c325FeBBE4F92"
    
    func sendTransaction() {
        do {
            let transaction = try Web3Manager.sendXRTToken(amount: sendingAmount, from: MyContsants.mockWallet, to: sendingAddress)
        } catch {
            fatalError(error.localizedDescription)
        }
        
    }
}
