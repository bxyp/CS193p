//
//  ContentView.swift
//  Memorize
//
//  Created by Bryan Xay on 9/29/23.
//


import SwiftUI


struct ContentView: View {
    
    //let emojis = ["👻", "🎃", "🕷️", "👹"]
    let Plants: [String] = ["🌲", "🌵", "🌴", "🌷", "🍀", "🌲", "🌷", "🌴", "🌳", "🌵", "🌳", "🍀"]
    let cars: [String] = ["🚗", "🚙", "🚓", "🚕", "🚗","🚙","🚓","🚕", "🏎️", "🚔", "🚔", "🏎️", "🚖", "🚖"]
    let Emojis: [String] = ["😮‍💨", "😱", "😊", "😭", "🥲", "😭", "😇", "😮‍💨", "😊", "😇", "🥲", "😱"]
    
    
    
    @State var cardCount: Int = 4
    
    
    //-----------------------
    //VarBody
    var body: some View {
        
        VStack{
            ScrollView{
                title
                cards
            }
            Spacer()
            cardCountAdjusters
            //themeChoosing
        }
        .padding()
    }
    
    //------------------------
    //ViewBody for cards
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                cardView(content: cars[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.purple)
    }
    
    //-----------------------
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
    
    //----------------------
    //Title for memorize game
    var title: some View{
        Text("Memorize!").font(.largeTitle).bold()
    }
    
    //----------------------
    //VarBody for ThemeChoosing
      
    
    
    
    //----------------------
    //Function for removing and adding cards
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > cars.count)
    }
    
    //----------------------
    //ViewBody to remove cards
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    //----------------
    //ViewBody to add cards
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
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
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
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

