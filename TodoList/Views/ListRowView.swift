//
//  ListRowView.swift
//  TodoList
//
//  Created by Daniil Antsyferov on 14/8/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let item1 = ItemModel(title: "Item 1", isCompleted: false)
    let item2 = ItemModel(title: "Item 2", isCompleted: true)
    
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
    
}
//.sizeThatFitsLayout()
