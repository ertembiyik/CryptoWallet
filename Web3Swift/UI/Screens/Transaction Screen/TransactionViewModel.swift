//
//  TransactionViewModel.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import SwiftUI

final class TransactionViewModel: ObservableObject {
    @Published var sendingAmount: String = ""
    @Published var sendingAddress: String = "0x97369cc8bf2E6d18351BB79BE10c325FeBBE4F92"
    @Published var transactionHash: String = ""
    @Published var isAlertPresented: Bool = false
    
    
    func sendTransaction() {
        Task {
            do {
                let hash = try await Web3Manager.sendTransaction(to: sendingAddress, amount: sendingAmount)
                print(hash)
                DispatchQueue.main.async {
                    self.transactionHash = hash
                    self.isAlertPresented = true
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
