//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/5/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    
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
            if self.card.isFaceUp {
                front(of: self.card)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(color)
                }
            }
        }
        .aspectRatio(self.cardAspectRatio, contentMode: .fit)
        .font(Font.system(size: fontSize(for: size)))
    }

    @ViewBuilder
    private func front(of card: MemoryGame<String>.Card) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
        Text(self.card.content)
    }
    
    // MARK: - Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let fontScaleFactor: CGFloat = 0.6
    private let cardAspectRatio: CGFloat = 2/3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: MemoryGameViewModel())
    }
}
