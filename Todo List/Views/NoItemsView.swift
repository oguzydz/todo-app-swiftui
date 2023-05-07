//
//  NoItemsView.swift
//  Financier
//
//  Created by Oğuz YILDIZ on 27.04.2023.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let secondayAccentColor = Color("SecondaryAccentColor")
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should clikc the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add something 🥳")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height:55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondayAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondayAccentColor.opacity(0.7) : Color.accentColor,
                    radius: animate ? 30: 10,
                    x: 0.0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else {return}
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

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
