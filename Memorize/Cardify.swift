//
//  Cardify.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/7/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    var isMatched: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                front(content: content)
            } else {
                if !isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(color)
                }
            }
        }
            .aspectRatio(self.cardAspectRatio, contentMode: .fit)
    }
    
    @ViewBuilder
    private func front(content: Content) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
        content
    }
    
    // MARK: - Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let cardAspectRatio: CGFloat = 2/3
}
