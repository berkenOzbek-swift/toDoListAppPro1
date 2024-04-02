//
//  ProfileViewViewModel.swift
//  toDoListApp
//
//  Created by Berken Özbek on 21.03.2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class ProfileViewViewModel: ObservableObject {
    
    @Published var user: User? = nil
    init() {}
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("Users")
            .document(userId)
            .getDocument { [weak self]snapshot, Error in
                guard let data = snapshot?.data(), Error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    self?.user = User(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", email: data["email"] as? String ?? "", joined: data["joined"] as? TimeInterval ?? 0)
                }
            }
    }
    func logOut() {
        do {
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
 
}
