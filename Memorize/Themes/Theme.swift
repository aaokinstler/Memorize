//
//  ThemeSet.swift
//  Memorize
//
//  Created by Anton Kinstler on 19.12.2021.
//

import Foundation
import SwiftUI


struct Theme: Identifiable, Codable {
    
    var name: String
    var emojiSet: [String]
    var numberOfPairs: Int
    var cardsColor: RGBAColor
    var id: Int
    
    struct RGBAColor: Codable, Equatable, Hashable {
        let red: Double
        let green: Double
        let blue: Double
        let alpha: Double
    }
}
