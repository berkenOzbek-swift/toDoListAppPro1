//
//  CustomFont.swift
//  toDoListApp
//
//  Created by Berken Özbek on 3.04.2024.
//

import SwiftUI

struct CustomFont: ViewModifier {
    var textStyle: TextStyle
    var size: CGFloat // size tipi düzeltilmeli
    var name: String {
        switch textStyle {
        case .title:
            return "Poppins Bold"
        case .body:
            return "Inter Regular"
        }
    }
    func body(content: Content) -> some View {
        content.font(.custom("Inter-Regular", size: size)) // relativeTo: .body kaldırıldı, size: size olarak düzeltildi
    }
}

extension View {
    func customFont(_ textStyle: TextStyle, size: CGFloat) -> some View { // size parametresi eklendi
        modifier(CustomFont(textStyle: TextStyle.body, size: size)) // modifier(CustomFont(size: size)) olarak düzeltildi
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

enum TextStyle {
    case title
    case body
}

