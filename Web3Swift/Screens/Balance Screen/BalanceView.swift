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
                Text("Balance: \(viewModel.balance) eth")
                    .font(.largeTitle).bold()
                    .padding()
                
                Spacer()
                
                ClassicButton(title: "Send eth")
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

struct ClassicButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
