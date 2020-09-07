//
//  RandomizedMemoryGame.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/6/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

class RandomizedMemoryGame: MemoryGameVM {
    override init() {
        super.init()
        model = RandomizedMemoryGame.createMemoryGame()
    }
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🎉","👠","❤️","🦎","🦑","🤠","🥶"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...7), theme: "Randomized", color: Color.yellow) { pairIndex in
            emojis[pairIndex]
        }
    }
}
