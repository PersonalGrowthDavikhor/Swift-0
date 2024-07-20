//
//  ContentView.swift
//  Memorize
//
//  Created by David Chircea on 20/7/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🎃", "👻", "🕷️", "😈", "👽", "💀", "🕸️", "🧙", "👹", "🙀", "😱", "🍭"]
    @State var cardCount = 4
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.purple)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {cardCount += offset},
               label: {Image(systemName: symbol)}
        )
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
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
            Group {
                //fill or stroke border, but not both
                //we're doing this for the card to be well seen in dark mode too
                //dashed border with 10 on, 2 off
                //base.strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10,2]))
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
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
