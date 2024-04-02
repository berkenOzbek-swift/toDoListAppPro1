//
//  toDoListItemsView.swift
//  toDoListApp
//
//  Created by Berken Özbek on 19.03.2024.
//

import SwiftUI

struct toDoListItemsView: View {
    @StateObject var viewModel = toDoListItemViewViewModel()
    let item: toDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title2)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }

        }
    }
}

#Preview {
    toDoListItemsView(item: .init(id: "123", title: "Buy milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
