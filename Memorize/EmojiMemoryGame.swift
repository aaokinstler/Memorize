//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anton Kinstler on 18.12.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    @Published private(set) var theme: Theme
    @Published private var model: MemoryGame<String>
    
    init() {
        let initTheme = Themes.allCases.randomElement()!.value
        theme = initTheme
        model = MemoryGame<String>(numberOfPairOfCards: (initTheme.numberOfPairs > initTheme.emojiSet.count) ? initTheme.emojiSet.count : initTheme.numberOfPairs) { pairIndex in
            initTheme.emojiSet[pairIndex]
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
        theme = Themes.allCases.randomElement()!.value
        model = MemoryGame<String>(numberOfPairOfCards: (theme.numberOfPairs > theme.emojiSet.count) ? theme.emojiSet.count : theme.numberOfPairs) { pairIndex in
            theme.emojiSet[pairIndex]
        }
    }
    
    func shuffle() {
        model.shuffle()
    }
}

