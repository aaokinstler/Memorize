//
//  MemoryGame.swift
//  Memorize
//
//  Created by Anton Kinstler on 18.12.2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score: Int = 0
    
    private var indexOfAnOneOndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched  {
            if let potentialIndex = indexOfAnOneOndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialIndex].isMatched = true
                    score += 4
                } else {
                    score -= 2
                }
                indexOfAnOneOndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfAnOneOndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        var cardsArray = Array<Card>()
        
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cardsArray.append(Card(content: content, id: pairIndex*2))
            cardsArray.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cardsArray.shuffled()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        let id: Int
    }
}
