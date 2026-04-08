//
//  Summer.swift
//  Sumdinger
//
//  Created by Russell Smith on 2/29/24.
//
//  This file creates a Summer class that gives information to the ContentView to be displayed

import Foundation

class Summer: ObservableObject {
    
    @Published private var theGame: Game = Game()
    
    var selected: String {
        var text = ""
        for diceIndex in theGame.selectedDiceIndex {
            text += String(diceIndex) + " "
        }
        return text
    }
    
    var sumOfDice: String {
        return String(theGame.sum)
    }
    
    func getDice(at index: Int) -> PlayingDice {
        return theGame.multipleDice.seeDice(at: index)
    }
    
    func tap(at index: Int) {
        theGame.addSelectedDiceIndex(at: index)
    }
    
    func turnBlue(_ value: Int) -> Bool {
        return theGame.isNumInAvailableSum(value: value)
    }
    
    func isSumRemoved(value: Int) -> Bool {
        return !theGame.availableSums.contains(value)
    }
    
    func isIndexSelected(value: Int) -> Bool {
        theGame.containsSelectedDiceIndex(value: value)
    }
    
    func rollAgain() {
        theGame.checkRollAgain()
    }
}
