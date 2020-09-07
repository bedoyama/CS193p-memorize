//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/6/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame(0)
    
    static func createMemoryGame(_ selectedTheme: Int) -> MemoryGame<String> {
        let theme = buildThemes()[selectedTheme]
        let emojis = theme.faces
        let numberOfPairs = theme.pairNumberIsRandom ? Int.random(in: 2...emojis.count) : emojis.count
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs, theme: theme.name, color: theme.color) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    static func buildThemes() -> [Theme] {
        var themes: [Theme] = []
        
        themes.append(Theme(name: "Halloween", faces: ["👻","🎃","🕷","🧛🏻‍♂️"], color: Color.orange, pairNumberIsRandom: false))
        themes.append(Theme(name: "Sea Creatures", faces: ["🦑","🦀","🐙","🦞","🐠"], color: Color.green, pairNumberIsRandom: false))
        themes.append(Theme(name: "Insects", faces: ["🦗","🐛","🐝","🐞","🦋"], color: Color.yellow, pairNumberIsRandom: false))
        themes.append(Theme(name: "Wings", faces: ["🐥","🦆","🦉","🦇"], color: Color.white, pairNumberIsRandom: false))
        themes.append(Theme(name: "Flowers", faces: ["🌻","🌺","🌹","🌼","💐"], color: Color.red, pairNumberIsRandom: false))
        themes.append(Theme(name: "Random", faces: ["🎉","👠","❤️","🦎","🦑","🤠","🥶"], color: Color.blue, pairNumberIsRandom: true))

        return themes
    }

    // MARK: Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var theme: String {
        model.theme
    }
    
    var color: Color {
        model.color
    }

    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    func restart(){
        model = MemoryGameViewModel.createMemoryGame(Int.random(in: 0..<6))
        
        return
    }
    
    // MARK: - Auxiliary
    
    struct Theme {
        var name: String
        var faces: [String]
        var color: Color
        var pairNumberIsRandom: Bool
    }
}
