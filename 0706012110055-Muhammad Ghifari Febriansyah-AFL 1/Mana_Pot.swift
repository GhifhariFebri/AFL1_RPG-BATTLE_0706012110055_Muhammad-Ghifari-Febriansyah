//
//  Mana_Pot.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 30/03/23.
//

import Foundation
class Mana_Potion: Potion{
    
    override func usePotion(player: Hero) {
        super.usePotion(player: hero)
        hero.mp += 10
    }
}

