//
//  Cardify.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/7/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            front(content: content).opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius).fill().opacity(isFaceUp ? 0 : 1)
        }
            .rotation3DEffect(Angle.degrees(rotation), axis: (x: 0, y: 1, z: 0))
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
