//
//  firstMainPage.swift
//  toDoListApp
//
//  Created by Berken Özbek on 4.04.2024.
//

import SwiftUI

struct firstMainPage: View {
    @State private var redirectToLogin = false
    
    var body: some View {
        NavigationView {
            VStack {
                BackgroundView()
                Text("Let's Do It")
                    .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                    .foregroundColor(.black)
                Button(action: {
                    self.redirectToLogin = true
                }) {
                    Text("Start For Plans")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
                .fullScreenCover(isPresented: $redirectToLogin) {
                    LoginView()
                }
            }
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        backgroundView()
    }
}

struct loginView: View {
    var body: some View {
        // Implement your login view here
        // For example:
        Text("Login View")
    }
}

struct firstMainPage_Previews: PreviewProvider {
    static var previews: some View {
        firstMainPage()
    }
}


