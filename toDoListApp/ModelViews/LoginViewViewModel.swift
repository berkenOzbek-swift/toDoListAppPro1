//
//  LoginViewViewModel.swift
//  toDoListApp
//
//  Created by Berken Özbek on 21.03.2024.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""       
       
       init() {}

    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }

   private func validate() -> Bool {
       errorMessage = ""
       
       guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
           errorMessage = "Please fill in the email field"
           return false
       }
       
       guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
           errorMessage = "Please fill in the password field"
           return false
       }
       
       guard email.contains("@") && email.contains(".") else {
           errorMessage = "Please enter a valid email address"
           return false
       }
       return true
    }
}
