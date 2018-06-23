//
//  Card.swift
//  Concentration
//
//  Created by Yong Lin Ma on 2018/6/23.
//  Copyright © 2018 Yong Lin Ma. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
