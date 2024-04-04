//
//  customFont1.swift
//  toDoListApp
//
//  Created by Berken Özbek on 4.04.2024.
//

import SwiftUI

struct customFont1: ViewModifier {
    
    var textStyle: Font.TextStyle
    
    var Name: String {
        switch textStyle {
        case .largeTitle, .title, .title2, .title3:
            return "Poppins Bold"
        case .body, .subheadline, .footnote, .caption:
            return "Inter Regular"
        case .headline, .caption2:
            return "Inter Semibold"
        case .callout:
            return "Error"
        @unknown default:
            return "Error"
        }
    }
    var size: CGFloat {
        switch textStyle {
        case .largeTitle:
            return 34
        case .title:
            return 28
        case .title2:
            return 24
        case .title3:
            return 20
        case .body:
            return 17
        case .headline:
            return 17
        case .subheadline:
            return 15
        case .footnote:
            return 13
        case .caption:
            return 12
        case .caption2:
            return 12
        case .callout:
            return 0
        @unknown default:
            return 0
        }
    }
    func body(content: Content) -> some View {
          content.font(.custom(Name, size: size))
      }
}
extension View {
    func customFont(_ textStyle: Font.TextStyle) -> some View {
        modifier(customFont1(textStyle: textStyle))
    }
}
enum textStyle {
    case largeTitle
    case title
    case title2
    case title3
    case body
    case headline
    case subheadline
    case subheadline2
    case footnote
    case footnote2
    case caption
    case caption2
}

