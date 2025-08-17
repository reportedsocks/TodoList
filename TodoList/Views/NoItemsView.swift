//
//  NoItemsView.swift
//  TodoList
//
//  Created by Daniil Antsyferov on 17/8/25.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Go on and add some items to the list!")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView()) {
                    Text("Add item")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.secondaryAccent : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.secondaryAccent.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                    
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
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
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
    
    
}
