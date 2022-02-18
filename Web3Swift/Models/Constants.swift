//
//  Constants.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import Foundation

struct MyContsants {
    static let mockWallet = try! Web3Manager.importAccount(by: "2404a482a212386ecf1ed054547cf4d28348ddf73d23325a83373f803138f105", name: "huyna")
    
    static let XRTToken = ERC20Token(name: "XRT Token", address: "0x5ffed6f7fb4345e20367b0ce57519e8c451acbbe", decimals: "18", symbol: "XRT")
}
