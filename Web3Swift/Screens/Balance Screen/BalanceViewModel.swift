//
//  BalanceViewModel.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import SwiftUI

final class BalanceViewModel: ObservableObject {
    @Published var balance = 12
    @Published var isShowingTransactionView = false
    
    func updateBalance() {  }
}
