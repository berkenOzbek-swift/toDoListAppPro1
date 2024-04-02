//
//  headerView.swift
//  toDoListApp
//
//  Created by Berken Özbek on 21.03.2024.
//

import SwiftUI

struct headerView: View {
    @State var title = ""
    @State var secondTitle = ""
    @State var color: Color
    @State var angle: Double
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                    
                Text(secondTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 50)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    headerView(color: .pink, angle: 10)
}
