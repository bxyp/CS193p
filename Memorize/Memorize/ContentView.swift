//
//  ContentView.swift
//  Memorize
//
//  Created by Bryan Xay on 9/29/23.
//


import SwiftUI


struct ContentView: View {
    //Computed Properties
    var body: some View {
        HStack{
            cardView(isFaceUp: true)
            cardView()
            cardView()
            cardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct cardView: View{
    var isFaceUp: Bool = false
    
    var body: some View{
        ZStack(content:  {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.purple)
                    
            }
        })
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

