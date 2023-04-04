//
//  Monster.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation
class Monster{
    var monsterAttack: Int
    var monsterHealth: Int
    var monsterName: String
    var monDrop: Int
    var printMonster: String{
        return """
        Monster : \(monsterName)
        Health : \(monsterHealth)
        """
    }
    
    init(monsterAttack: Int, monsterHealth: Int, monsterName: String, monDrop: Int) {
        self.monsterAttack = monsterAttack
        self.monsterHealth = monsterHealth
        self.monsterName = monsterName
        self.monDrop = monDrop
    }
    
    func monsterTurn(player: Hero){
    monsterAttack = Int.random(in: 5...10)
    print("The Enemy \(monsterName) attack! It deals \(monsterAttack)")
    hero.health -= monsterAttack
    }
    
    func monsterWin(player: Hero){
    print("The Enemy \(monsterName) has defeated you...")
    print("Returning you to the main menu")
    hero.health = 20
    hero.mp = 10
    monsterHealth = 1000
    hero.multiplier = 1
    hero.chance = 2
    }
    
    func monsterDrop(drop: Potion){
        monDrop = Int.random(in: 5...15)
        drop.amount += monDrop
    }
    
}
