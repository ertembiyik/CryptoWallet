//
//  TransactionView.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import SwiftUI

struct TransactionView: View {
    
    @StateObject var viewModel = TransactionViewModel()
    
    var body: some View {
        VStack {
            Form {
                TextField("Token addres",
                          text: $viewModel.sendingAddress)
                TextField("Amount", text: $viewModel.sendingAmount)
                    .keyboardType(.numbersAndPunctuation)
            }
            
            Spacer()
            
            ClassicButton(title: "Send")
                .onTapGesture {
                    viewModel.sendTransaction()
                }
                .padding()
        }
        .alert(viewModel.transactionHash, isPresented: $viewModel.isAlertPresented) {
            Button("Ok", role: .cancel) { viewModel.isAlertPresented = false}
            Button("Copy") { UIPasteboard.general.string = viewModel.transactionHash}
        }
        
        
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
