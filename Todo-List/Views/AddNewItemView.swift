//
//  AddNewItemView.swift
//  Todo-List
//
//  Created by Frédéric Helfer on 14/10/22.
//

import SwiftUI

struct AddNewItemView: View {
    @ObservedObject var data: ItemViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var details = ""
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            
            TextField("Details", text: $details)
            
            Button {
                if !title.isEmpty {
                    data.saveNewItem(title: title, details: details)
                    dismiss()
                }
            } label: {
                Text("save".uppercased())
            }
        }
    }
}

struct AddNewItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItemView(data: ItemViewModel())
    }
}
