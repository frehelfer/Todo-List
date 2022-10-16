//
//  Model.swift
//  Todo-List
//
//  Created by Frédéric Helfer on 14/10/22.
//

import Foundation

struct ItemModel: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var details: String
    var done = false
    
    static var example = ItemModel(title: "Caminhar com a Besh", details: "Levar Biscoito, ela gosta.")
}
