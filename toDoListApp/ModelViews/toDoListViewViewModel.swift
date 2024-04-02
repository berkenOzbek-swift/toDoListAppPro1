//
//  toDoListViewViewModel.swift
//  toDoListApp
//
//  Created by Berken Özbek on 21.03.2024.
//
import FirebaseFirestore
import Foundation

class toDoListViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    private let UserId: String
    init(UserId: String) {
        self.UserId = UserId
    }
    
    func delete(id: String) {
    
        let db = Firestore.firestore()
        db.collection("Users")
            .document(UserId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
