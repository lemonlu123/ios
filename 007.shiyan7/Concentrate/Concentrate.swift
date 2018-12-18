//
//  Concentrate.swift
//  Concentrate
//
//  Created by 客人用户 on 2018/12/18.
//  Copyright © 2018年 yx. All rights reserved.
//

import Foundation  //与UI无关
class Concentrate
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFacedUpCard: Int?
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            //            cards.append(card)
            //            cards.append(card)//拷贝一个card
            cards += [card, card] //与注释同理
        }
        // xipai  daluan
        func choose(at index: Int){
            if  !cards[index].isMatched {
                if let matchIndex = indexOfOneAndOnlyFacedUpCard,matchIndex != index {
                    //check 配对
                    if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFacedUpCard = nil //有两张匹配或者不匹配的卡片正面朝上 所以没有可选
                }else{
                    //没有cards朝上 或者 有两张朝上
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFaceUp = false
                        cards[index].isFaceUp = true // 正面朝上
                        indexOfOneAndOnlyFacedUpCard = index
                    }
                }
                
            }
        }
        
    }
}
