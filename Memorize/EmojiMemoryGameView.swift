//
//  ContentView.swift
//  Memorize
//
//  Created by David Chircea on 20/7/24.
//

import SwiftUI

// Main view for the Emoji Memory Game
struct EmojiMemoryGameView: View {
    
    // ObservedObject to keep track of the game's state and updates
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            // ScrollView to contain the cards
            ScrollView {
                cards
            }
            // Shuffle button to shuffle the cards
            Button("Shuffle") {
                viewModel.shuffle()
            }
            .padding()
        }
    }
    
    // Computed property for the grid of cards
    var cards: some View {
        
        // LazyVGrid to create a grid layout with adaptive columns
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            // Loop through the indices of the cards in the view model
            ForEach(viewModel.cards.indices, id: \.self) { index in
                // Create a CardView for each card
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.purple) // Set the foreground color for the grid
    }
}

// View for an individual card
struct CardView: View {
    let card: MemoryGame<String>.Card
    
    // Initializer to set the card property
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            // Define a rounded rectangle shape with a corner radius
            let base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            Group {
                // Fill the card with white color and add a stroke border
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                // Display the card's content as text
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            // Set the opacity to 1 if the card is face up, otherwise 0
            .opacity(card.isFaceUp ? 1 : 0)
            // Fill the card with color if it is face down
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

// Preview provider for the EmojiMemoryGameView
struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a sample view model for the preview
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
