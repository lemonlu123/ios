//
//  Card.swift
//  Concentrate
//
//  Created by apple on 2018/10/22.
//  Copyright © 2018年 yanlu All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
            identifierFactory += 1
            return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
