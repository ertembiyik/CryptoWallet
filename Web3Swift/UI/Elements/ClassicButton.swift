//
//  ClassicButton.swift
//  Web3Swift
//
//  Created by Ertem Biyik on 17.02.2022.
//

import SwiftUI

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

struct ClassicButton_Previews: PreviewProvider {
    static var previews: some View {
        ClassicButton(title: "Button")
    }
}
