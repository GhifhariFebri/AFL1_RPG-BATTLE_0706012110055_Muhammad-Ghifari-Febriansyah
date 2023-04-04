//
//  Physical_Attack.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation
class Attack: Skill{
    var damage: Int
    
        
        init(skillName: String, mpUsage: Int, skillDesc: String, damage: Int) {
            self.damage = damage
            super.init(skillName: skillName, mpUsage: mpUsage, skillDesc: skillDesc)
        }
    
    override func useSKill(player: Hero, monster: Monster) {
        super.useSKill(player: player, monster: monster)
        print("\nYou attack your enemy using Meteor Attack!")
        print("You deal \(damage*hero.multiplier) Attack!")
        print("it's very effective!")
        monster.monsterHealth  -= damage*hero.multiplier
    }
}
