//
//  MemorizeGame.swift
//  Memorize
//
//  Created by David Chircea on 22/7/24.
//

import Foundation

// Define a generic struct for the Memory Game, where CardContent is the type of the content on the cards
struct MemoryGame<CardContent> where CardContent: Equatable {
    // Array of cards in the game, can be read from outside but only set from within the struct
    private(set) var cards: [Card]
    
    // Initializer that takes the number of pairs of cards and a factory function to generate card content
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [] // Initialize the cards array
        
        // Loop over the number of pairs to create the cards, at least 2
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            // Generate the content for this pair of cards using the factory function
            let content = cardContentFactory(pairIndex)
            // Add two cards with the same content to the array
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    // Method to handle choosing a card (game logic to be implemented)
    mutating func choose(card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices{
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // FIXME: bogus
    }
    
    // Method to shuffle the cards in the game
    mutating func shuffle() {
        cards.shuffle()
    }
    
    // Nested struct to represent a single card in the game
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        /*static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.isFaceUp == rhs.isFaceUp &&
            lhs.isMatched == rhs.isMatched &&
            lhs.content == rhs.content
        }*/
        
        var isFaceUp = true // Boolean to track if the card is face up
        var isMatched = false // Boolean to track if the card has been matched
        let content: CardContent // Content of the card
        
        var id: String
        var debugDescription: String {
            "\(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}
