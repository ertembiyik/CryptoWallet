//
//  ContentView.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 16.02.2022.
//

import SwiftUI

struct BalanceView: View {
    
    @StateObject var viewModel = BalanceViewModel()
    
    var body: some View {
            VStack {
                Text("Balance: \(viewModel.balance) xrt")
                    .font(.largeTitle).bold()
                    .padding()
                
                Spacer()
                
                ClassicButton(title: "Send xrt")
                    .padding()
                    .onTapGesture {
                        viewModel.isShowingTransactionView = true
                    }
            }
            .sheet(isPresented: $viewModel.isShowingTransactionView) {
                TransactionView()
            }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
