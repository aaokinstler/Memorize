//
//  ThemeStore.swift
//  Memorize
//
//  Created by Anton Kinstler on 08.01.2022.
//

import SwiftUI

class ThemeStore: ObservableObject {
    
    private let storeName = "GameThemes"
    
    @Published var themes = [Theme]() {
        didSet {
            storeInUserDefaults()
        }
    }
    
    init() {
        restoreFromUserDefaults()
        if themes.isEmpty {
            var currentIndex = 0
            DefaultThemes.allCases.forEach { theme in
                let themeValue = theme.value
                insertTheme(name: themeValue.name , emojis: themeValue.emojiSet, at: currentIndex, numberOfPairs: themeValue.numberOfPairs, color: UIColor(Color(rgbaColor: themeValue.cardsColor)))
                currentIndex += 1
            }
        }
    }
    
    // MARK: - Intent
    
    func theme(at index: Int) -> Theme {
        let safeIndex = min(max(index, 0), themes.count - 1)
        return themes[safeIndex]
    }
    
    func removeTheme(at index: Int) -> Int {
        if themes.count > 1, themes.indices.contains(index) {
            themes.remove(at: index)
        }
        return index % themes.count
    }
    
    func insertTheme(name: String, emojis:[String], at index: Int, numberOfPairs: Int?, color: UIColor) {
        
        let unique = (themes.max(by: { $0.id < $1.id })?.id ?? 0) + 1
        let safeNumberOfPairs = getSafeNumberOfPairs(emojis.count, numberOfPairs)
        let rgbaColor = Theme.RGBAColor(color: Color(color))
        let theme = Theme(name: name, emojiSet: emojis, numberOfPairs: safeNumberOfPairs, cardsColor: rgbaColor, id: unique)
        let safeIndex = min(max(index, 0), themes.count)
        themes.insert(theme, at: safeIndex)
        
    }
    
    private func getSafeNumberOfPairs(_ emojisCount: Int, _ numberOfPairs: Int?) -> Int {
        var safeNumberOfPairs = 0
        if let numberOfPairs = numberOfPairs {
            safeNumberOfPairs = numberOfPairs > emojisCount ? emojisCount : emojisCount
        } else {
            safeNumberOfPairs = emojisCount
        }
        return safeNumberOfPairs
    }
    
    // MARK: - Storing and Restoring
    
    private func storeInUserDefaults() {
        UserDefaults.standard.set(try? JSONEncoder().encode(themes), forKey: storeName)
    }
    
    private func restoreFromUserDefaults() {
        if let jsonData = UserDefaults.standard.data(forKey: storeName),
           let decodedThemes = try? JSONDecoder().decode(Array<Theme>.self, from: jsonData) {
            themes = decodedThemes
        }
    }
}
