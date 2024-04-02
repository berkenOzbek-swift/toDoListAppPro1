//
//  TLButton.swift
//  toDoListApp
//
//  Created by Berken Özbek on 21.03.2024.
//

import SwiftUI

struct TLButton: View {
    @State var text: String
    @State var color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) { // Eylemi düğmeyle ilişkilendir
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(color)
                Text(text)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(text: "Sign In", color: .blue){
        //action
    }
}
