//
//  Dice.swift
//  DiceRoll
//
//  Created by  on 10/30/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import Foundation

class Dice {
    
    var value: Int = 1
    
    init() {
        value = 1
    }
    
    init(rolledValue: Int) {
        value = rolledValue
    }
    
    func roll() {
        value = Int.random(in: 1...6)
    }

}
