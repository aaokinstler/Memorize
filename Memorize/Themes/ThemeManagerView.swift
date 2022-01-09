//
//  ThemeManagerView.swift
//  Memorize
//
//  Created by Anton Kinstler on 07.01.2022.
//

import SwiftUI

struct ThemeManagerView: View {
    @EnvironmentObject var store: ThemeStore
    @Environment(\.presentationMode) var presentationMode
    @State private var themeToEdit: Theme?
    @State private var editMode: EditMode = .inactive
    @State private var currentGames: Dictionary<Int, EmojiMemoryGame> = [:]
        
    var body: some View {
        NavigationView {
            List {
                ForEach(store.themes) { theme in
                    NavigationLink (destination: EmojiMemoryGameView(game: getGame(theme: theme))) {
                            VStack(alignment: .leading) {
                                Text(theme.name).foregroundColor(Color(rgbaColor: theme.cardsColor))
                                Text(theme.emojiSet.joined())
                            }
                        }
                    .gesture(editMode == .active ? tapGesture(theme: theme) : nil)
                }
                .onDelete { indexSet in
                    store.themes.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Choose your theme!")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button{
                        store.insertTheme(name: "", emojis: [], at: 0, numberOfPairs: 0, color: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
                        themeToEdit = store.theme(at: 0)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem{
                    EditButton()
                }
            }
            .popover(item: $themeToEdit) { theme in
                ThemeEditorView(theme: $store.themes[theme])
            }
            .environment(\.editMode, $editMode)
            .onChange(of: themeToEdit) {[themeToEdit] newValue in
                if newValue == nil {
                    if let gameToRestart = currentGames[themeToEdit!.id] {
                        gameToRestart.newGame()
                    }
                }
            }
        }
    }
    
    private func tapGesture(theme: Theme) -> some Gesture  {
        TapGesture().onEnded{
            themeToEdit = theme
        }
    }
    
    
    private func getGame(theme: Theme) -> EmojiMemoryGame {
        if let game = currentGames[theme.id] {
            return game
        } else {
            let game = EmojiMemoryGame(theme)
            currentGames[theme.id] = game
            return game
        }
    }
    
}

struct ThemeManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeManagerView().environmentObject(ThemeStore())
    }
}
