//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Mauricio Bedoya on 9/6/20.
//  Copyright © 2020 Mauricio Bedoya. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
