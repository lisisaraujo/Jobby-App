//
//  ButtonView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import SwiftUI

struct ButtonView: View {
    var title: String
    var action: () -> Void
    var color: Color = .blue
    
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(color)
                .cornerRadius(20)
        }
    }
}

#Preview {
    ButtonView(title: "Button", action: {
        print("Button tapped!")
    })
}
