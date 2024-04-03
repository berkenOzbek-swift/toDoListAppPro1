//
//  backgroundView.swift
//  toDoListApp
//
//  Created by Berken Özbek on 3.04.2024.
//

import SwiftUI
import RiveRuntime

struct backgroundView: View {
    var body: some View {
        RiveViewModel(fileName: "shapes")
            .view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(Image("Spline")
                .blur(radius: 50)
                .offset(x: 200, y: 100))
    }
}

#Preview {
    backgroundView()
}
