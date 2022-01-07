//
//  Themes.swift
//  Memorize
//
//  Created by Anton Kinstler on 20.12.2021.
//

import Foundation

enum Themes: CaseIterable {
    case animals, vehicles, flags, food, sports, buildings
    
    var value: Theme {
        switch self {
        case .animals:
            return Theme(name: "Animals", emojiSet: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🙈", "🐔", "🐦", "🐣", "🦆", "🦅", "🐝", "🦉", "🦇", "🐌"].shuffled(), numberOfPairs: 14, cardsColor: .yellow)
        case .vehicles:
            return Theme(name: "Vehicles", emojiSet: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚟", "🚃", "🚞", "🚝", "✈️", "⛵️", "🛶"].shuffled(), numberOfPairs: 10, cardsColor: .blue)
        case .flags:
            return Theme(name: "Flags", emojiSet: ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🏳️‍🌈", "🏳️‍⚧️", "🇺🇳", "🇦🇺", "🇦🇹", "🇦🇿", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇮", "🇦🇴", "🇦🇩", "🇦🇶", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇿", "🇧🇪", "🇧🇯", "🇧🇲", "🇧🇬", "🇧🇴", "🇧🇴", "🇧🇶", "🇧🇦", "🇧🇼", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇭🇺", "🇻🇪", "🇻🇬"].shuffled(), numberOfPairs: 9, cardsColor: .red)
        case .food:
            return Theme(name: "Food", emojiSet: ["🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🥭", "🍍", "🥥", "🥝", "🍆", "🥑", "🥦", "🌶", "🥨"].shuffled(), numberOfPairs: 11, cardsColor: .gray)
        case .sports:
            return Theme(name: "Sports", emojiSet: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏉", "🏑", "🏏", "🪃", "🥊", "🥋", "🎽", "⛷", "🪂", "🤸‍♀️", "🤼‍♀️", "⛳️", "🎣", "🏹", "🛼", "🥅", "🏸", "🏒", "🪀"].shuffled(), numberOfPairs: 9, cardsColor: .green)
        case .buildings:
            return Theme(name: "Buildings", emojiSet: ["🎡", "🎢", "🗽", "🗼", "⛺️", "🛖", "🕌", "🏛"], numberOfPairs: 10, cardsColor: .cyan)
        }
    }
}
