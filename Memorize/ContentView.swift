//
//  ContentView.swift
//  Memorize
//
//  Created by Anton Kinstler on 14.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    var emojisAnimals =  ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🙈", "🐔", "🐦", "🐣", "🦆", "🦅", "🐝", "🦉", "🦇", "🐌"]
    
    var emojisTransport = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚟", "🚃", "🚞", "🚝", "✈️", "⛵️", "🛶"]
    
    var emojisFlags = ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🏳️‍🌈", "🏳️‍⚧️", "🇺🇳", "🇦🇺", "🇦🇹", "🇦🇿", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇮", "🇦🇴", "🇦🇩", "🇦🇶", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇿", "🇧🇪", "🇧🇯", "🇧🇲", "🇧🇬", "🇧🇴", "🇧🇴", "🇧🇶", "🇧🇦", "🇧🇼", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇭🇺", "🇻🇪", "🇻🇬"]
    
    @State var currentSet: Array<String> = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🙈", "🐔", "🐦", "🐣", "🦆", "🦅", "🐝", "🦉", "🦇", "🐌"]
    
    @State var emojiCount = 10
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(currentSet[0..<currentSet.count], id: \.self) { emoji in
                        CardView(text: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            buttonBar.font(.largeTitle).padding(.horizontal)
        }.padding()
    }
    
    var transport: some View {
        VStack {
            Button {
                currentSet = emojisTransport.shuffled()
            } label: {
                Image(systemName: "car")
            }
            Text("Vehicles").font(.footnote).foregroundColor(.blue)
        }
    }
    
    var animals: some View {
        VStack {
            Button {
                currentSet = emojisAnimals.shuffled()
            } label: {
                Image(systemName: "pawprint")
            }
            Text("Animals").font(.footnote).foregroundColor(.blue)
        }
    }
    
    var flags: some View {
        VStack{
            Button {
                currentSet = emojisFlags.shuffled()
            } label: {
                Image(systemName: "flag")
            }
            Text("Flags").font(.footnote).foregroundColor(.blue)
        }
    }
    
    var buttonBar: some View {
        HStack {
            transport
            Spacer()
            animals
            Spacer()
            flags
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < currentSet.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    var text: String
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20).strokeBorder(lineWidth: 3)
                Text(text).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
