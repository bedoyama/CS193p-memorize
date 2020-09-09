//
//  View+Cardify.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/7/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
