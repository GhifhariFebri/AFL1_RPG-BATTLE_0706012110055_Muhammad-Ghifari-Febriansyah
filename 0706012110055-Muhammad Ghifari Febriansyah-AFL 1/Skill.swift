//
//  Skill.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

class Skill {
    var skillName: String
    var mpUsage: Int
    var skillDesc: String
    var printSKill: String{
        return
        """
        - \(skillDesc)
        """
    }
    
    init(skillName: String, mpUsage: Int, skillDesc: String) {
        self.skillName = skillName
        self.mpUsage = mpUsage
        self.skillDesc = skillDesc
    }
        
    func useSKill(player: Hero, monster: Monster){
        hero.mp -= mpUsage
        }
}
