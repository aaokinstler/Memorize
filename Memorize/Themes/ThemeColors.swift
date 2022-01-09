//
//  ThemeColours.swift
//  Memorize
//
//  Created by Anton Kinstler on 09.01.2022.
//

import SwiftUI

struct ThemeColor: Identifiable {
    
    let id: Int
    let color: Color
    
    static var allColors: [ThemeColor] {
        get {
            [ThemeColor(id: 0, color: Color(UIColor.yellow)), ThemeColor(id: 1, color: Color(UIColor.green)), ThemeColor(id: 2, color: Color(UIColor.red)), ThemeColor(id: 3, color: Color(UIColor.blue)), ThemeColor(id: 4, color: Color(UIColor.cyan)), ThemeColor(id: 5, color: Color(UIColor.brown)), ThemeColor(id: 6, color: Color(UIColor.magenta)), ThemeColor(id: 7, color: Color(UIColor.orange)), ThemeColor(id: 8, color: Color(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3))), ThemeColor(id: 9, color: Color(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6))), ThemeColor(id: 10, color: Color(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)))]
        }
    }
}
