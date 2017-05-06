//
//  actionButton.swift
//  VirtualPet
//
//  Created by 王巍 on 2/6/17.
//  Copyright © 2017 王巍. All rights reserved.
//

import Foundation
class actionButton{
    enum petType{
        case dog
        case bird
        case fish
        case cat
        case bunny
    }
    var happiness = 0
    var foodLevel = 0
    var pet:petType
    
    init(pet: petType, h: Int, f: Int) {
        self.pet = pet
        self.happiness = h
        self.foodLevel = f
    }
//    func transfer(a: Int, b: Int) -> (Int, Int){
//        
//    }
    func feed() -> (Int){
        if foodLevel < 10{
            foodLevel += 1
        }
        return foodLevel
    }
    func play() -> (Int, Int){
        if foodLevel > 0 && happiness < 10{
            foodLevel -= 1
            happiness += 1
        }
        return (happiness, foodLevel)
    }
}
