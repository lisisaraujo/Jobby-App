//
//  WelcomeScreenView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import SwiftUI

struct WelcomeScreenView: View {
    
    @Binding var username: String
    @Binding var isAppStarted: Bool
    
    var body: some View {
        VStack {
            if let savedUsername = UserDefaults.standard.string(forKey: "username"), !savedUsername.isEmpty {
                Text("Welcome, \(savedUsername)!")
            } else {
                TextField("Enter your username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
                        ButtonView(title: "Start", action: {
                            if !username.isEmpty {
                                UserDefaults.standard.set(username, forKey: "username")
                                isAppStarted = true
                            }
                        })
                        .padding()
        }
//        .onAppear{
//            isAppStarted = true
//        }
    }
}

#Preview {
    WelcomeScreenView(username: .constant("Lisis"), isAppStarted: .constant(false))
}
