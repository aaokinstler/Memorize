//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Anton Kinstler on 14.12.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let themeStore = ThemeStore()
    
    var body: some Scene {
        WindowGroup {
            ThemeManagerView().environmentObject(themeStore)
        }
    }
}
