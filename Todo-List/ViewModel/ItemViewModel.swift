//
//  ViewModel.swift
//  Todo-List
//
//  Created by Frédéric Helfer on 14/10/22.
//

import Foundation
import SwiftUI

class ItemViewModel: ObservableObject {
    let itemKey = "items"
    
    @Published var items: [ItemModel] = [ItemModel]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: itemKey)
            }
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.data(forKey: itemKey) {
            if let decoded = try? JSONDecoder().decode([ItemModel].self, from: saved) {
                items = decoded
                return
            }
        }
        
        items = []
    }
    
    func saveNewItem(title: String, details: String) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
        
        if !trimmedTitle.isEmpty {
            let newItem = ItemModel(title: trimmedTitle, details: details)
            items.append(newItem)
        }
    }
    
    func delete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func move(indexSet: IndexSet, int: Int) {
        items.move(fromOffsets: indexSet, toOffset: int)
    }
}
