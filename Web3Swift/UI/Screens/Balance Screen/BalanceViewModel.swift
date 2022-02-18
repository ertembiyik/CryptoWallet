//
//  BalanceViewModel.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import SwiftUI

final class BalanceViewModel: ObservableObject {
    @Published var balance = try! Web3Manager.getXRTBalance(for: MyContsants.mockWallet)
    @Published var isShowingTransactionView = false
    
    func updateBalance() {  }
}
