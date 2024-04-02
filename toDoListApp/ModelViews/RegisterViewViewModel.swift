//
//  RegisterViewViewModel.swift
//  toDoListApp
//
//  Created by Berken Özbek on 21.03.2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func createdUser() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self.insertUserRecord(id: userId)
        }
    }
    private func insertUserRecord(id: String) {
        
        let newUser = User.init(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("Users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    private func validate() -> Bool{
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter the full name"
            return false
        }
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in password field"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter the valid email"
            return false
        }
        guard password.count >= 8 else {
            errorMessage = "Please enter at least 8 character password"
            return false
        }
        return true
    }
}
