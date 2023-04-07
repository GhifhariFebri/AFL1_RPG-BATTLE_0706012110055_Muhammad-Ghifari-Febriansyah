//
//  Monster.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation
class Monster: Enemy{
    var monsterAttack: Int
    var monsterHealth: Int
    var monsterName: String
    var monDrop: Int
    var monsterType: String
    var monsterDescription = ""
    var printMonster: String{
        return """
        Monster : \(monsterName) \(monsterType)
        Health : \(monsterHealth)
        """
    }

    init(monsterAttack: Int, monsterHealth: Int, monsterName: String, monDrop: Int, monsterType: String) {
        self.monsterAttack = monsterAttack
        self.monsterHealth = monsterHealth
        self.monsterName = monsterName
        self.monDrop = monDrop
        self.monsterType = monsterType
    }
    
    func meetBoss(chance: Int) {
        if chance > 75 {
            monsterAttack = Int.random(in: 10...20)
            monsterHealth = 2000
            monsterType = "[Boss]"
        }
        else{
            monsterAttack = Int.random(in: 5...10)
            monsterHealth = 500
            monsterType = "[Normal]"
        }
    }
    
    func enemyTurn(player: Hero){
    print("\nThe Enemy \(monsterName) \(monsterType) attack! It deals \(monsterAttack) damage")
    hero.health -= monsterAttack
    }

    func enemyWin(player: Hero){
    print("The Enemy \(monsterName) \(monsterType) has defeated you...")
    print("Returning you to the main menu")
    hero.health = 20
    hero.mp = 10
    hero.multiplier = 1
    hero.chance = 2
    }

    func enemyDrop(drop: Potion){
        if monsterType == "[Boss]"{
            monDrop = Int.random(in: 15...25)
        }
        else{
            monDrop = Int.random(in: 5...15)
        }
        drop.amount += monDrop
    }

}
