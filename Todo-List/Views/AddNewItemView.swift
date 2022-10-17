//
//  AddNewItemView.swift
//  Todo-List
//
//  Created by Frédéric Helfer on 14/10/22.
//

import SwiftUI

struct AddNewItemView: View {
    @EnvironmentObject var data: ItemViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var details = ""
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(.blue)
                        .padding(5)
                }
                Spacer()
            }
            
            Text("Add New Item")
                .font(.title.bold())
            
            ScrollView {
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                
                TextField("Details", text: $details)
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                
                Button {
                    if !title.isEmpty {
                        data.addItem(title: title, details: details)
                        dismiss()
                    }
                } label: {
                    Text("save".uppercased())
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

struct AddNewItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItemView()
    }
}
