//
//  Themes.swift
//  Memorize
//
//  Created by Anton Kinstler on 20.12.2021.
//

//import Foundation
import SwiftUI

enum DefaultThemes: CaseIterable {
    case animals, vehicles, flags, food, sports, buildings
    
    var value: Theme {
        switch self {
        case .animals:
            return Theme(name: "Animals", emojiSet: ["đś", "đą", "đ­", "đš", "đ°", "đŚ", "đť", "đź", "đťââď¸", "đ¨", "đŻ", "đŚ", "đŽ", "đˇ", "đ˝", "đ¸", "đľ", "đ", "đ", "đŚ", "đŁ", "đŚ", "đŚ", "đ", "đŚ", "đŚ", "đ"].shuffled(), numberOfPairs: 14, cardsColor: Theme.RGBAColor(color: Color(UIColor.yellow)), id: 0)
        case .vehicles:
            return Theme(name: "Vehicles", emojiSet: ["đ", "đ", "đ", "đ", "đ", "đ", "đ", "đ", "đ", "đ", "đť", "đ", "đ", "đ", "đŚŻ", "đŚ˝", "đŚź", "đ´", "đ˛", "đľ", "đ", "đş", "đ¨", "đ", "đ", "đ", "đ", "đĄ", "đ", "đ", "đ", "đ", "âď¸", "âľď¸", "đś"].shuffled(), numberOfPairs: 10, cardsColor: Theme.RGBAColor(color: Color(UIColor.blue)), id: 1)
        case .flags:
            return Theme(name: "Flags", emojiSet: ["đłď¸", "đ´", "đ´ââ ď¸", "đ", "đŠ", "đłď¸âđ", "đłď¸ââ§ď¸", "đşđł", "đŚđş", "đŚđš", "đŚđż", "đŚđ˝", "đŚđą", "đŠđż", "đŚđ¸", "đŚđŽ", "đŚđ´", "đŚđŠ", "đŚđś", "đ§đŠ", "đ§đ§", "đ§đž", "đ§đż", "đ§đŞ", "đ§đŻ", "đ§đ˛", "đ§đŹ", "đ§đ´", "đ§đ´", "đ§đś", "đ§đŚ", "đ§đź", "đ´ó §ó ˘ó Ľó Žó §ó ż", "đ´ó §ó ˘ó łó Łó ´ó ż", "đ´ó §ó ˘ó ˇó Źó łó ż", "đ­đş", "đťđŞ", "đťđŹ"].shuffled(), numberOfPairs: 9, cardsColor:Theme.RGBAColor(color: Color(UIColor.red)), id: 2)
        case .food:
            return Theme(name: "Food", emojiSet: ["đ", "đ", "đ", "đ", "đ", "đ", "đ", "đ", "đŤ", "đ", "đĽ­", "đ", "đĽĽ", "đĽ", "đ", "đĽ", "đĽŚ", "đś", "đĽ¨"].shuffled(), numberOfPairs: 11, cardsColor: Theme.RGBAColor(color: Color(UIColor.gray)), id: 3)
        case .sports:
            return Theme(name: "Sports", emojiSet: ["â˝ď¸", "đ", "đ", "âžď¸", "đž", "đ", "đ", "đ", "đŞ", "đĽ", "đĽ", "đ˝", "âˇ", "đŞ", "đ¤¸ââď¸", "đ¤źââď¸", "âłď¸", "đŁ", "đš", "đź", "đĽ", "đ¸", "đ", "đŞ"].shuffled(), numberOfPairs: 9, cardsColor: Theme.RGBAColor(color: Color(UIColor.green)), id: 4)
        case .buildings:
            return Theme(name: "Buildings", emojiSet: ["đĄ", "đ˘", "đ˝", "đź", "âşď¸", "đ", "đ", "đ"], numberOfPairs: 10, cardsColor: Theme.RGBAColor(color: Color(UIColor.cyan)), id: 5)
        }
    }
}
