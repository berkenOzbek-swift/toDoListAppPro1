//
//  RegisterView.swift
//  toDoListApp
//
//  Created by Berken Özbek on 19.03.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
        VStack {
            //HEADER

            headerView(title: "Register", secondTitle: "Start Organizing ToDos", color: .orange, angle: -15)
            //register Tab
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Adress", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TLButton(text: "Sign In", color: .orange){
                    viewModel.createdUser()
                }
            }
            .padding(.bottom, 120)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
