//
//  toDoListItem.swift
//  toDoListApp
//
//  Created by Berken Özbek on 19.03.2024.
//

import Foundation

struct toDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
