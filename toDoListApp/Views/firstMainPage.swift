//
//  firstMainPage.swift
//  toDoListApp
//
//  Created by Berken Özbek on 4.04.2024.
//

import SwiftUI

struct firstMainPage: View {
    @State private var redirectToLogin = false
    @State private var animationStart = false

    var body: some View {
        NavigationView {
            VStack {
                BackgroundView()
                Text("Let's Do It")
                    .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                    .foregroundColor(.black)
                    .animation(.easeInOut(duration: 0.5))
                riveButton(text: "Star For Plans", action: {
                    self.redirectToLogin = true
                })
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
        Text("Login View")
    }
}

struct firstMainPage_Previews: PreviewProvider {
    static var previews: some View {
        firstMainPage()
    }
}


