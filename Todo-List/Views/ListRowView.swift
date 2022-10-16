//
//  ListRowView.swift
//  Todo-List
//
//  Created by Frédéric Helfer on 15/10/22.
//

import SwiftUI

struct ListRowView: View {
    @ObservedObject var data: ItemViewModel
    var item: ItemModel
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 0) {
                Text(item.title)
                
                Text(item.details)
                    .font(.caption)
                    .opacity(0.7)
            }
            
            Spacer()
            
            Button {
                var newItem = item
                newItem.done.toggle()
                
                if let index = data.items.firstIndex(of: item) {
                    data.items[index] = newItem
                }
            } label: {
                Label("Mark as done", systemImage: item.done ? "checkmark.circle.fill" : "circle")
                    .labelStyle(.iconOnly)
                    .foregroundColor(item.done ? .green : .red.opacity(0.5))
            }
        }
        .padding(.vertical, 5)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(data: ItemViewModel(), item: ItemModel.example)
    }
}
