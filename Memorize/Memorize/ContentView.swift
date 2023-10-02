//
//  ContentView.swift
//  Memorize
//
//  Created by Bryan Xay on 9/29/23.
//


import SwiftUI


struct ContentView: View {
    
    //let emojis = ["👻", "🎃", "🕷️", "👹"]
    let emojis: [String] = ["👻", "🎃", "🕷️", "👹", "🌵", "🌝", "🌩️", "💣", "🚗", "⭐️", "😱", "😈"]
    
    @State var cardCount: Int = 4
    
    
//---------
    
    //VarBody
    var body: some View {
        VStack{
            
            cards
            cardCountAdjusters
        }
        .padding()
    }
//--------------------
    
    //ViewBody for cards
    var cards: some View {
        HStack{
            ForEach(0..<cardCount, id: \.self) { index in
                cardView(content: emojis[index])
            }
        }
        .foregroundColor(.purple)
    }
//--------------------
    
    //VarBody to either subtract or add cards
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
//--------------------
    
    //ViewBody to remove cards
    var cardRemover: some View {
        Button(action: {
            if cardCount > 1{
                cardCount -= 1
            }
            
        }, label:{
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
//----------------
    
    //ViewBody to add cards
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count{
                cardCount += 1
            }
        }, label:{
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
    }
}
//---------------

struct cardView: View{
    let content: String
    //isFaceUp is a boolean
    @State var isFaceUp = true
    
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
//-----------

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

