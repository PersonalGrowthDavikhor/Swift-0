//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by David Chircea on 22/7/24.
//

import SwiftUI

// Definition of the EmojiMemoryGame class
class EmojiMemoryGame: ObservableObject {
    // Static array of emoji strings
    private static let emojis = ["🎃", "👻", "🕷️", "😈", "👽", "💀", "🕸️", "🧙", "👹", "🙀", "😱", "🍭"]
    
    // Static function to create a MemoryGame instance with emojis
    private static func createMemoryGame() -> MemoryGame<String> {
        // Initialize MemoryGame with 10 pairs of cards using emojis
        return MemoryGame(numberOfPairsOfCards: 10) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex] // Return the emoji for the given pairIndex
            } else {
                return "⁉️" // Return a default emoji if pairIndex is out of bounds
            }
        }
    }
    
    // Instance variable to hold the MemoryGame model
    @Published private var model = createMemoryGame()
    
    // Computed property to access the cards from the model
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - INTENTS
    
    // Function to shuffle the cards in the memory game
    func shuffle() {
        model.shuffle()
    }
    
    // Function to choose a card in the memory game
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
