//
//  PlayingDice.swift
//  Sumdinger
//
//  Created by Russell Smith on 2/27/24.
//
//  Creates the PlayingDice Structure

import Foundation

struct PlayingDice {
    
    var value: Int
    
    var imageName: String {
        return "D" + String(value)
    }
}
