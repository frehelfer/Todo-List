//
//  NoItemsView.swift
//  Todo-List
//
//  Created by Frédéric Helfer on 17/10/22.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("There are no Items!")
                    .font(.title)
                
                NavigationLink {
                    AddNewItemView()
                } label: {
                    Text("Add Something")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
    }
}
