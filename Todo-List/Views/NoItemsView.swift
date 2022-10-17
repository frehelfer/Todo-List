//
//  NoItemsView.swift
//  Todo-List
//
//  Created by Frédéric Helfer on 17/10/22.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no Items!")
                    .font(.title)
                    .padding(.bottom, 30)
                
                NavigationLink {
                    AddNewItemView()
                } label: {
                    Text("Add Something")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
//                        .padding()
                        .background(animate ? .red : .blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 40)
                .shadow(color: animate ? .red.opacity(0.7) : .blue.opacity(0.7), radius: animate ? 30 : 10, x: 0, y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
    }
}
