//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/5/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.theme).font(Font.title).padding(4)
            Grid(viewModel.cards) { card in
                CardView(card: card, color: self.viewModel.color).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            .padding(5)
            }
            .padding()
            .foregroundColor(viewModel.color)
            HStack {
                Button.init(action: {
                    self.viewModel.restart()
                }) { Text("Restart") }
                Text("Score " + String(self.viewModel.score))
            }.padding(3)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size:CGSize) -> some View {
        ZStack {
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90))
                .padding(5)
                .opacity(0.25)
            Text(card.content)
                .font(Font.system(size: fontSize(for: size)))
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
        }
            .cardify(isFaceUp: card.isFaceUp, isMatched: card.isMatched, color: color)
    }

    // MARK: - Drawing Constants
    
    private let fontScaleFactor: CGFloat = 0.55
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return MemoryGameView(viewModel: game)
    }
}
