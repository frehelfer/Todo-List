//
//  ContentView.swift
//  Todo-List
//
//  Created by Frédéric Helfer on 14/10/22.
//

import SwiftUI

struct ListView: View {
    @StateObject var data = ItemViewModel()
    
    @State var showingAddItemSheet = false
    
    var body: some View {
        NavigationView {
            Group {
                if data.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity
                            .animation(.easeIn))
                } else {
                    List {
                        ForEach(data.items) { item in
                            ListRowView(item: item)
                        }
                        .onDelete(perform: data.deleteItem)
                        .onMove(perform: data.moveItem)
                        .listRowBackground(Color.gray.opacity(0.1))
                    }
                }
            }
            .navigationBarTitle("Todo-List")
            .sheet(isPresented: $showingAddItemSheet) {
                AddNewItemView()
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
        .environmentObject(data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .preferredColorScheme(.dark)
    }
}


