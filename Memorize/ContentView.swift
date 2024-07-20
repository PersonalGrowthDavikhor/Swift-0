//
//  ContentView.swift
//  Memorize
//
//  Created by David Chircea on 20/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
            CardView(isFaceUp: true)
        }
        .foregroundColor(.purple)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    
    var body: some View {
        ZStack {
            if isFaceUp {
                //fill or stroke border, but not both
                //we're doing this for the card to be well seen in dark mode too
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .strokeBorder(lineWidth: 3)
                //dashed border with 10 on, 2 off
                /*RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                 .strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10,2]))
                 */
                Text("🤓").font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
