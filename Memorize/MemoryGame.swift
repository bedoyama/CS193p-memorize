//
//  MemoryGame.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/5/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    var theme: String
    var color: Color
    var score: Int
    
    private var indexOfFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    score -= 1
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, theme: String, color: Color, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        self.theme = theme
        self.color = color
        self.score = 0
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false {
            didSet {
                if isFaceUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        
        var isMatched: Bool = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        
        var content: CardContent
        var id: Int
        
        // MARK: - Bonus Time
        
        var bonusTimeLimit: TimeInterval = 6
        var lastFaceUpdate: Date?
        var pastFaceUpTime: TimeInterval = 0

        private var faceUpTime: TimeInterval {
            if let lastFaceUpdate = self.lastFaceUpdate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpdate)
            } else {
                return pastFaceUpTime
            }
        }
                        
        var bonusTimeRemaining: Double {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }

        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpdate == nil {
                lastFaceUpdate = Date()
            }
        }
        
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            self.lastFaceUpdate = nil
        }
    }
}
