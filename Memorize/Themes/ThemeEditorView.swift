//
//  ThemeEditorView.swift
//  Memorize
//
//  Created by Anton Kinstler on 08.01.2022.
//

import SwiftUI

struct ThemeEditorView: View {
    @Binding var theme: Theme
    
    var body: some View {
        Form {
            nameSection
            deleteEmojisSection
            addEmojisSection
        }
        .frame(minWidth: 300,  minHeight: 350)
    }
    
    var nameSection: some View {
        Section(header: Text("Name")) {
            TextField("Name", text: $theme.name)
        }
    }
    @State private var emojisToAdd = ""
    
    var deleteEmojisSection: some View {
        Section(header: Text("Emojis")){
            let emojis = theme.emojiSet
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(emojis, id: \.self) { emoji in
                    Text(emoji)
                        .onTapGesture {
                            theme.emojiSet.removeAll(where: {$0 == emoji} )
                        }
                }
            }
        }
    }
    
    var addEmojisSection: some View {
        Section(header: Text("Emojis to add")) {
            TextField("", text: $emojisToAdd)
                .onChange(of: emojisToAdd) { emojis in
                    addEmojis(emojis)
                }
        }
    }
    
    private func addEmojis(_ emojis: String) {
        withAnimation {
            let emojisArray = Array(emojis)
//            theme.emojiSet.append(contentsOf: emojisArray)
        }
    }
}

struct ThemeEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeEditorView(theme: .constant(ThemeStore().theme(at: 0))).previewLayout(.fixed(width: 300, height: 350))
    }
}
