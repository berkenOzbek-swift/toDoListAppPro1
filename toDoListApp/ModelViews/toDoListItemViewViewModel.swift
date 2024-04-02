//
//  toDoListItemViewViewModel.swift
//  toDoListApp
//
//  Created by Berken Özbek on 21.03.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class toDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: toDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("Users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}


