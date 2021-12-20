//
//  ContentView.swift
//  Memorize
//
//  Created by Anton Kinstler on 14.12.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    
    var body: some View {
        VStack {
            
            HStack{
                Text(String(game.score))
                Spacer()
                Text(game.theme.name)
                Spacer()
                newGame
            }.padding().font(.title)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }.foregroundColor(game.theme.cardsColor)
            }.padding()
        }
    }
    
    var newGame: some View {
        Button {
            game.newGame()
        } label: {
            Text("New game")
        }
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game).previewInterfaceOrientation(.portrait)
    }
}
