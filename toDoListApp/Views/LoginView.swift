//
//  LoginView.swift
//  toDoListApp
//
//  Created by Berken Özbek on 19.03.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // HEADER
                headerView(title: "To Do List", secondTitle: "Getting Around Here", color: .pink, angle: 15)
                
                // LOGIN Tab
                Form {
                    if !viewModel.errorMessage.isEmpty {
                           ScrollView {
                               Text(viewModel.errorMessage)
                                   .foregroundColor(.red)
                                   .multilineTextAlignment(.center)
                           }
                       }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(text: "Log In", color: .pink) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)

                // Create User
                VStack {
                    Text("New Around Here")
                    
                    // Go to registration view
                    NavigationLink("Create New Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
