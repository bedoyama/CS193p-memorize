//
//  Array+Only.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/6/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
