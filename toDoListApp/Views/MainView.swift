//
//  MainView.swift
//  toDoListApp
//
//  Created by Berken Özbek on 19.03.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignIn, !viewModel.currentuserId.isEmpty {
            //sigIn
            accountView
        }else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View{
        TabView {
            toDoListView(userId: viewModel.currentuserId)
                .tabItem {
                    Label("House", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
                .tabItem {
                    Label("House", systemImage: "house")
                }
        }
    }
}

#Preview {
    MainView()
}
