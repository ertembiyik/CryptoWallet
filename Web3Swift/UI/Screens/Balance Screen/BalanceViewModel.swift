//
//  BalanceViewModel.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import SwiftUI

final class BalanceViewModel: ObservableObject {
    @Published var balance = ""
    @Published var isShowingTransactionView = false
    
    func updateBalance() {
        Task {
            do {
                let bal = try await Web3Manager.getBalance()
                DispatchQueue.main.async {
                    self.balance = bal
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
