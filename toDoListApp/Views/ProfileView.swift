//
//  ProfileView.swift
//  toDoListApp
//
//  Created by Berken Özbek on 19.03.2024.
//
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack{
                backgroundView()
                if let user = viewModel.user {
                    profile(user: user)
                }else {
                    Text("Loading Users....")
                }
             }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View{
        //Avatar Image
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        //Name, Since Member etc.
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                    .foregroundColor(.orange)
                Text(user.name)
            }
            .padding(.top, 1)
            HStack {
                Text("Email: ")
                    .bold()
                    .foregroundColor(.orange)
                Text(user.email)
            }
            .padding(.top, 10)
            HStack {
                Text("Since Member: ")
                    .bold()
                    .foregroundColor(.orange)
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(.top, 10)
        }
        .padding()
        //Log Out
        Button("Log  Out") {
            viewModel.logOut()
        }
        .tint(.red)
        Spacer()
    }
}

#Preview {
    ProfileView()
}
