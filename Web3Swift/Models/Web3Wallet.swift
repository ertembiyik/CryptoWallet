//
//  Web3Wallet.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 18.02.2022.
//

import Foundation

struct Web3Wallet: Equatable {
    let address: String
    let data: Data
    let name: String
    let type: WalletType
}
enum WalletType: Equatable {
    case normal
    case hd(mnemonics: [String])
}
