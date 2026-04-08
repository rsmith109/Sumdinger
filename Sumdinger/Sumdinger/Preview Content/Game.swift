//
//  Game.swift
//  Sumdinger
//
//  Created by Russell Smith on 2/28/24.
//
//  This file uses a Dice object and adds aspects of the Sumdinger Game 

import Foundation

struct Game {
    
    static let sums = [3, 4, 5, 6, 7, 8, 9, 10, 11]
    
    var availableSums: [Int]
    var selectedDiceIndex: [Int]
    var multipleDice = Dice()
    
    var sum: Int {
        var total = 0
        for index in selectedDiceIndex {
            total += multipleDice.seeDice(at: index).value
        }
        return total
    }
    
    init() {
        availableSums = []
        selectedDiceIndex = []
        
        for number in Game.sums {
            availableSums.append(number)
        }
    }
    
    mutating func addSelectedDiceIndex(at index: Int) {
        if let indexOfIndex = selectedDiceIndex.firstIndex(of: index) {   // found using: https://www.hackingwithswift.com/forums/swift/remove-item-from-array/3735#:~:text=firstIndex(of%3A)%20to%20find,at%3A)%20to%20remove%20it.&text=Instead%20of%20trying%20to%20find,the%20selected%20hymn's%20id%20property.
            selectedDiceIndex.remove(at: indexOfIndex)
        }
        else {
            selectedDiceIndex.append(index)
        }
    }
    
    mutating func rollFiveDice() {
        multipleDice.roll()
    }
    
    func isNumInAvailableSum(value: Int) -> Bool {
        return availableSums.contains(value)
    }
    
    func checkFreeRoll() -> Bool {
        if selectedDiceIndex.count == 2 {
            
            let total = multipleDice.seeDice(at: selectedDiceIndex[0]).value + multipleDice.seeDice(at: selectedDiceIndex[1]).value
            return total == 2 || total == 12
        }
        return false
    }
    
    func containsSelectedDiceIndex(value: Int) -> Bool {
        return selectedDiceIndex.contains(value)
    }
    
    mutating func removeSum() {
        if let index = availableSums.firstIndex(of: sum) {
            availableSums.remove(at: index)
        }
    }
    
    mutating func checkRollAgain() {
        if availableSums.contains(sum) && selectedDiceIndex.count == 2 {
            removeSum()
            rollFiveDice()
            selectedDiceIndex = []
        }
        else if checkFreeRoll() {
            rollFiveDice()
            selectedDiceIndex = []
        }
    }
}
