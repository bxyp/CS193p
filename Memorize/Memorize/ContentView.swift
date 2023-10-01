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
        let emojis: [String] = ["👻", "🎃", "🕷️", "👹"]

        HStack{
            cardView(content:emojis[0], isFaceUp: false)
            cardView(content:emojis[1], isFaceUp: false)
            cardView(content:emojis[2], isFaceUp: false)
            cardView(content:emojis[3], isFaceUp: false)
        }
        .padding()
        .foregroundColor(.purple)
    }
}

struct cardView: View{
    
    let content: String
    //isFaceUp is a boolean
    @State var isFaceUp = false
    
    var body: some View{
        ZStack  {
            //Local Variable (Let means that it is a constant and won't change)
            //Type inference
            let base = RoundedRectangle(cornerRadius: 12)
            
            //if the card is faceup
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

