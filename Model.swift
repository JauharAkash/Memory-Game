//
// Akash Jauhar
// Memory Game - Project 3
// CSC 184 - Professor Re
//
//  Model.swift
//  MemoryGame
//
//  Copyright © 2020 Akash Jauhar. All rights reserved.
//

import Foundation
class Model
{
    
    var cards = [brain]()
    var One_Card_Up: Int?
    
    // 3 combination
    func choosCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = One_Card_Up, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    if(cards[index].isMatched == true){
                        print("matched");
                    cards[index].isFaceUp = true
                    }
                }
                cards[index].isFaceUp = true
                One_Card_Up = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                One_Card_Up = index
            }
        }
    }
    
    //Generating the random cards - in pairs
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = brain()
            cards += [card, card] // in pairs
        }
        
        // Shuffle the cards
        cards.shuffle()
    }
    
}
