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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.themes) { theme in
                        NavigationLink(destination: EmojiMemoryGameView(game: EmojiMemoryGame(theme))) {
                            VStack {
                                Text(theme.name)
                                Text(theme.emojiSet.joined())
                            }
                        }.gesture(editMode == .active ? tapGesture(theme: theme) : nil)

                }
                .onDelete { indexSet in
                    store.themes.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Choose your theme!")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    EditButton()
                }
            }
            .popover(item: $themeToEdit) { theme in
                ThemeEditorView(theme: $store.themes[theme])
            }
            .environment(\.editMode, $editMode)
        }
    }
    
    private func tapGesture(theme: Theme) -> some Gesture  {
        TapGesture().onEnded{
            themeToEdit = theme
        }
    }
}

struct ThemeManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeManagerView().environmentObject(ThemeStore())
//        PaletteManager()
//            .previewDevice("iPhone 8")
//            .environmentObject(PaletteStore(named: "Preview"))
//            .preferredColorScheme(.light)
    }
}
