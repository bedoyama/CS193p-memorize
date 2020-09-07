//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/6/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame(Int.random(in: 0..<Theme.buildThemes().count))
    
    static func createMemoryGame(_ selectedTheme: Int) -> MemoryGame<String> {
        let theme = Theme.buildThemes()[selectedTheme]
        let emojis = theme.faces
        let numberOfPairs = theme.pairNumberIsRandom ? Int.random(in: 2...emojis.count) : emojis.count
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs, theme: theme.name, color: theme.color) { pairIndex in
            emojis[pairIndex]
        }
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
    
    var score: Int {
        model.score
    }

    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    func restart(){
        model = MemoryGameViewModel.createMemoryGame(Int.random(in: 0..<Theme.buildThemes().count))
        
        return
    }
    
    // MARK: - Auxiliary
    
    struct Theme {
        var name: String
        var faces: [String]
        var color: Color
        var pairNumberIsRandom: Bool
        
        static func buildThemes() -> [Theme] {
            var themes: [Theme] = []
            
            themes.append(Theme(name: "Cosmic", faces: ["🌞","🌜","🌎","🌊","👽","🐳","☄️"], color: Color.pink, pairNumberIsRandom: false))
            themes.append(Theme(name: "Halloween", faces: ["👻","🎃","🕷","🧛🏻‍♂️"], color: Color.orange, pairNumberIsRandom: false))
            themes.append(Theme(name: "Sea Creatures", faces: ["🦑","🦀","🐙","🦞","🐠"], color: Color.green, pairNumberIsRandom: false))
            themes.append(Theme(name: "Insects", faces: ["🦗","🐛","🐝","🐞","🦋"], color: Color.yellow, pairNumberIsRandom: false))
            themes.append(Theme(name: "Wings", faces: ["🐥","🦆","🦉","🦇"], color: Color.purple, pairNumberIsRandom: false))
            themes.append(Theme(name: "Flowers", faces: ["🌻","🌺","🌹","🌼","💐"], color: Color.red, pairNumberIsRandom: false))
            themes.append(Theme(name: "Random", faces: ["🎉","👠","❤️","🦎","🦑","🤠","🥶"], color: Color.blue, pairNumberIsRandom: true))
            themes.append(Theme(name: "Random 2", faces: ["🌟","🌈","🌪","🍿","♟","📟","🎛"], color: Color.init(red: 0.8, green: 0.3, blue: 0.5), pairNumberIsRandom: true))
            themes.append(Theme(name: "Random 3", faces: ["ℑ","✞","🀄︎","☞","✬","␕","♹","☂︎"], color: Color(red: Double.random(in: 0...1.0), green: Double.random(in: 0...1.0), blue: Double.random(in: 0...1.0)), pairNumberIsRandom: true))

            return themes
        }
    }
}
