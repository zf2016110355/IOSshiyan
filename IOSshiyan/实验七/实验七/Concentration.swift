//
//  Concentration.swift
//  实验七
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 周帆. All rights reserved.
//

import Foundation

class Concentration
{
    var score = 0
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    if cards[matchIndex].isSeen {
                        score -= 1
                    }
                    if cards[index].isSeen {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        // TODO: Shuffle the cards
        cards.sort { _,_ in arc4random_uniform(2) > 0 }
        
    }
    
}
