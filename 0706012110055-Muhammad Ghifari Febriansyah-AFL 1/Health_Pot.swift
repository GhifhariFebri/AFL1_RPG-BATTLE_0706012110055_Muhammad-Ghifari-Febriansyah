//
//  Health_Pot.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 30/03/23.
//

import Foundation
class Health_Potion: Potion {
    override func useItem(player: Hero) {
        super.useItem(player: hero)
        hero.health += 20
    }
}
