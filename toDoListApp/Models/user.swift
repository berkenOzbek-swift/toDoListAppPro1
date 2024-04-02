//
//  user.swift
//  toDoListApp
//
//  Created by Berken Özbek on 19.03.2024.
//

import Foundation

struct User: Codable {
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
