//
//  Shield.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation
class Shield: Skill{
    var turn: Int
        
        init(skillName: String, mpUsage: Int, skillDesc: String, turn: Int) {
            self.turn = turn
            super.init(skillName: skillName, mpUsage: mpUsage, skillDesc: skillDesc)
        }
    
    override func useSKill(player: Hero, monster: Monster) {
        super.useSKill(player: player, monster: monster)
        print("You use \(skillName)")
        turn = 1
        print("Your shield is up now. It will run out in the next turn")
    }
    
    func isUp(){
        print("\nYou block the enemy's attack for this turn!")
        print("Your shield is gone now!")
        turn -= 1
        battleMenu()
    }
    
}
