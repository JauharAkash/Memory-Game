//
// Akash Jauhar
// Memory Game - Project 3
// CSC 184 - Professor Re
//
//  brain.swift
//  MemoryGame
//
//  Copyright © 2020 Akash Jauhar. All rights reserved.
//

import Foundation
struct brain
{
    var isMatched = false
    var identifier: Int
    var isFaceUp = false
    
    static var counter = 0
    static func getUniqueIdentifer() -> Int {
        counter += 1
        return counter
    }
    
    init() {
        self.identifier = brain.getUniqueIdentifer()
    }
}
