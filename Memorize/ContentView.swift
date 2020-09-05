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
        return HStack(content: {
            ForEach(0..<4, content: { index in
                ZStack (content: {
                    RoundedRectangle(cornerRadius: 12.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 12.0).stroke(lineWidth: 3)
                    Text("👻")
                })
            })
        })
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}











































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
