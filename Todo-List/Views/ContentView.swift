//
//  ContentView.swift
//  Todo-List
//
//  Created by Frédéric Helfer on 14/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = ItemViewModel()
    
    @State var showingAddItemSheet = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(data.items) { item in
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
                                Label("Mark as done", systemImage: item.done ? "checkmark.circle.fill" : "x.circle")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(item.done ? .green : .red)
                            }
                        }
                        .padding(.vertical, 7)
                    }
                    .onDelete(perform: data.delete)
                    .onMove(perform: data.move)
                    .listRowBackground(Color.gray.opacity(0.1))
                }
                .navigationBarTitle("Todo-List")
                .sheet(isPresented: $showingAddItemSheet) {
                    AddNewItemView(data: data)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddItemSheet = true
                        } label: {
                            Label("Add new item", systemImage: "plus")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
