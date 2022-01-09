//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anton Kinstler on 18.12.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    @Published  var theme: Theme {
        didSet {
            newGame()
        }
    }
    @Published private var model: MemoryGame<String>
    
    init(_ chosenTheme: Theme) {
        theme = chosenTheme
        model = MemoryGame<String>(numberOfPairOfCards: (chosenTheme.numberOfPairs > chosenTheme.emojiSet.count) ? chosenTheme.emojiSet.count : chosenTheme.numberOfPairs) { pairIndex in
            chosenTheme.emojiSet[pairIndex]
        }
    }
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    // MARK: - Intents
    
    func choose (_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        model = MemoryGame<String>(numberOfPairOfCards: (theme.numberOfPairs > theme.emojiSet.count) ? theme.emojiSet.count : theme.numberOfPairs) { pairIndex in
            theme.emojiSet[pairIndex]
        }
    }
    
    func shuffle() {
        model.shuffle()
    }
}

