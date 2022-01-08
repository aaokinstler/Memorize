//
//  Themes.swift
//  Memorize
//
//  Created by Anton Kinstler on 20.12.2021.
//

//import Foundation
import SwiftUI

enum Themes: CaseIterable {
    case animals, vehicles, flags, food, sports, buildings
    
    var value: Theme {
        switch self {
        case .animals:
            return Theme(name: "Animals", emojiSet: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🙈", "🐔", "🐦", "🐣", "🦆", "🦅", "🐝", "🦉", "🦇", "🐌"].shuffled(), numberOfPairs: 14, cardsColor: Theme.RGBAColor(color: Color(UIColor.yellow)), id: 0)
        case .vehicles:
            return Theme(name: "Vehicles", emojiSet: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚟", "🚃", "🚞", "🚝", "✈️", "⛵️", "🛶"].shuffled(), numberOfPairs: 10, cardsColor: Theme.RGBAColor(color: Color(UIColor.blue)), id: 1)
        case .flags:
            return Theme(name: "Flags", emojiSet: ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🏳️‍🌈", "🏳️‍⚧️", "🇺🇳", "🇦🇺", "🇦🇹", "🇦🇿", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇮", "🇦🇴", "🇦🇩", "🇦🇶", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇿", "🇧🇪", "🇧🇯", "🇧🇲", "🇧🇬", "🇧🇴", "🇧🇴", "🇧🇶", "🇧🇦", "🇧🇼", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇭🇺", "🇻🇪", "🇻🇬"].shuffled(), numberOfPairs: 9, cardsColor:Theme.RGBAColor(color: Color(UIColor.red)), id: 2)
        case .food:
            return Theme(name: "Food", emojiSet: ["🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🥭", "🍍", "🥥", "🥝", "🍆", "🥑", "🥦", "🌶", "🥨"].shuffled(), numberOfPairs: 11, cardsColor: Theme.RGBAColor(color: Color(UIColor.gray)), id: 3)
        case .sports:
            return Theme(name: "Sports", emojiSet: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏉", "🏑", "🏏", "🪃", "🥊", "🥋", "🎽", "⛷", "🪂", "🤸‍♀️", "🤼‍♀️", "⛳️", "🎣", "🏹", "🛼", "🥅", "🏸", "🏒", "🪀"].shuffled(), numberOfPairs: 9, cardsColor: Theme.RGBAColor(color: Color(UIColor.green)), id: 4)
        case .buildings:
            return Theme(name: "Buildings", emojiSet: ["🎡", "🎢", "🗽", "🗼", "⛺️", "🛖", "🕌", "🏛"], numberOfPairs: 10, cardsColor: Theme.RGBAColor(color: Color(UIColor.cyan)), id: 5)
        }
    }
}
