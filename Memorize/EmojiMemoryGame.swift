//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anton Kinstler on 18.12.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojisTransport = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚟", "🚃", "🚞", "🚝", "✈️", "⛵️", "🛶"]
   
    static let emojisFlags = ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🏳️‍🌈", "🏳️‍⚧️", "🇺🇳", "🇦🇺", "🇦🇹", "🇦🇿", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇮", "🇦🇴", "🇦🇩", "🇦🇶", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇿", "🇧🇪", "🇧🇯", "🇧🇲", "🇧🇬", "🇧🇴", "🇧🇴", "🇧🇶", "🇧🇦", "🇧🇼", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇭🇺", "🇻🇪", "🇻🇬"]
    
    static let emojisAnimals =  ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🙈", "🐔", "🐦", "🐣", "🦆", "🦅", "🐝", "🦉", "🦇", "🐌"]
    
    static func createMemoryGame() -> MemoryGame<String> {
         MemoryGame<String>(numberOfPairOfCards: 6) { pairIndex in
             emojisTransport[pairIndex]
         }
     }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: Intents
    
    func choose (_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

