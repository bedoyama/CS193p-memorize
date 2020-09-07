//
//  MemoryGameVM.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/6/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

class MemoryGameVM: ObservableObject {
    @Published var model: MemoryGame<String>?
    
    // MARK: Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model!.cards
    }
    
    var theme: String {
        model!.theme
    }
    
    var color: Color {
        model!.color
    }

    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model!.choose(card: card)
    }
}
