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
            cardView(isFaceUp: false)
            cardView(isFaceUp: true)
            cardView(isFaceUp: false)
        }
        .padding()
        .foregroundColor(.purple)
    }
}

struct cardView: View{
    //isFaceUp is a boolean
    var isFaceUp: Bool
    
    var body: some View{
        ZStack  {
            //Local Variable (Let means that it is a constant and won't change)
            //Type inference
            let base = RoundedRectangle(cornerRadius: 12)
            
            //if the card is faceup
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                base.fill()
            }
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

