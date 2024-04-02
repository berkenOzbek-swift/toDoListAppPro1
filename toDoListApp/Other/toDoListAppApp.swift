//
//  toDoListAppApp.swift
//  toDoListApp
//
//  Created by Berken Özbek on 19.03.2024.
//
import FirebaseCore
import SwiftUI

@main
struct toDoListAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
