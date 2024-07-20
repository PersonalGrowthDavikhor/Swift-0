//
//  ContentView.swift
//  Memorize
//
//  Created by David Chircea on 20/7/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🎃", "👻", "🕷️", "😈", "👽"]
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) {index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.purple)
        .padding()
    }
}

struct CardView: View {
    //let xk no hay default
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            //let is const
            let base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if isFaceUp {
                //fill or stroke border, but not both
                //we're doing this for the card to be well seen in dark mode too
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                //dashed border with 10 on, 2 off
                //base.strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10,2]))
                Text(content).font(.largeTitle)
            }
            else {base}
        }
        .onTapGesture {
            print("tapped!")
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
