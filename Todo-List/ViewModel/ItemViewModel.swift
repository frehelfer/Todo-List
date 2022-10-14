//
//  ViewModel.swift
//  Todo-List
//
//  Created by Frédéric Helfer on 14/10/22.
//

import Foundation

class ItemViewModel: ObservableObject {
    let itemKey = "items"
    
    @Published var items: [ItemModel] = [] {
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
    }
}
