//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/5/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: MemoryGameVM
    
    var body: some View {
        VStack {
            Text(viewModel.theme).font(Font.title).padding(4)
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            .padding(5)
            }
            .padding()
            .foregroundColor(Color.orange)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size:CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
                }
            }
        }
        .aspectRatio(self.cardAspectRatio, contentMode: .fit)
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.6
    let cardAspectRatio: CGFloat = 2/3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: EmojiMemoryGame())
    }
}
