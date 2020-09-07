//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/5/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: MemoryGameVM {
    override init() {
        super.init()
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷","🦎","🦑","🤠","🥶"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5), theme: "Halloween") { pairIndex in
            emojis[pairIndex]
        }
    }
}
