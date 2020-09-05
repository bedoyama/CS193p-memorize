//
//  ContentView.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/5/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                CardView()
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12.0).fill(Color.white)
            RoundedRectangle(cornerRadius: 12.0).stroke(lineWidth: 3)
            Text("👻")
        }
    }
}









































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
