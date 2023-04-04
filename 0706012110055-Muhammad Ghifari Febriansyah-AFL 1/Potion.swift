//
//  Potion.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

class Potion {
    var potionName: String
    var amount: Int
    var potionDesc: String
    var printPotion: String{
        return
        """
        - \(potionName) : \(amount)x, \(potionDesc)
        """
    }
    
    init(_ potionName: String, amount: Int, potionDesc: String) {
        self.potionName = potionName
        self.amount = amount
        self.potionDesc = potionDesc
    }
        
    func usePotion(player: Hero){
        amount -= 1

    }
    
}
