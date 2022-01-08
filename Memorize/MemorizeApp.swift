//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Anton Kinstler on 14.12.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
//    @StateObject var initTheme = Themes.allCases.randomElement()!.value
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)//.environmentObject(initTheme)
        }
    }
}
