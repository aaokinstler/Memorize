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
            if theme.emojiSet.count > 2 {
                pairRedactorSection
            }
            colorPicker
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
                            withAnimation{
                                theme.emojiSet.removeAll(where: {$0 == emoji} )
                            }
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
    
    var pairRedactorSection: some View {
        Section(header: Text("Card count")) {
            Stepper(value: $theme.numberOfPairs, in: ClosedRange(2..<$theme.emojiSet.count)) {
                Text("\(theme.numberOfPairs) Pairs")
            }
        }
    }

   
    
    var colorPicker: some View {
        Section(header: Text("Color")) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))])  {
                ForEach(ThemeColor.allColors) { color in
                    //                    let sampleCard = RoundedRectangle(cornerRadius: 5)
                    ZStack(alignment: .bottomTrailing){
                        RoundedRectangle(cornerRadius: 5)
                            .aspectRatio(2/3, contentMode: .fit)
                            .foregroundColor(color.color)
                            .onTapGesture {
                                chooseColor(color: color.color)
                            }

                        if color.color ==  theme.color {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(color.color == Color(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)) ? .white : .black)
                                .padding(5)
                                
                          
                        }
                    }
                }
            }
        }
    }
    
    private func addEmojis(_ emojis: String) {
        withAnimation {
            let emojisArray = Array(emojis).filter({$0.isEmoji}).map({String($0)})
            theme.emojiSet = (theme.emojiSet + emojisArray).uniqued()
        }
    }
    
    private func chooseColor(color: Color) {
        theme.color = color
    }
}

struct ThemeEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeEditorView(theme: .constant(ThemeStore().theme(at: 0))).previewLayout(.fixed(width: 300, height: 500))
    }
}
