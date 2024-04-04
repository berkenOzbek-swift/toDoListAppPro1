//
//  riveButton.swift
//  toDoListApp
//
//  Created by Berken Özbek on 3.04.2024.
//

import SwiftUI
import RiveRuntime

struct riveButton: View {
    @State var text: String
    let button = RiveViewModel(fileName: "button")
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            ZStack {
                button.view()
                    .frame(width: 236, height: 64)
                    .overlay (
                        Label(text, systemImage: "arrow.forward")
                            .offset(CGSize(width: 10.0, height: 10.0))
                            .font(.headline))
                   
                }
            }
        }
    }

#Preview {
    riveButton(text: "Login"){
        //act.
    }
}
