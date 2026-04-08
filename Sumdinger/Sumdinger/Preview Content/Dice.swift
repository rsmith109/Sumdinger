//
//  Dice.swift
//  Sumdinger
//
//  Created by Russell Smith on 2/27/24.
//
// This file creates the list of Dice and some helper functions

import Foundation

struct Dice {
    
    var allDice: [PlayingDice]

    init() {
        allDice = []
        
        for _ in 0..<5 {
            let dice = PlayingDice(value: Int.random(in: 1...6))
            allDice.append(dice)
        }
    }
    
    mutating func roll() {
        allDice = []
        for _ in  0..<5 {
            let dice = PlayingDice(value: Int.random(in:1...6))
            allDice.append(dice)
        }
    }
    
    func seeDice(at index: Int) -> PlayingDice {
        let number = allDice[index]
        return number
    }
}







