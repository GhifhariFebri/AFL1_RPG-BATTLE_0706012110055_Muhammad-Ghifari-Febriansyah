//
//  Hero.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation
struct Hero {
    var mp: Int
    var health: Int
    var name: String
    var multiplier: Int
    var chance = 2
    var inventory: [Potion]
       
    var printHero: String {
        return "\nName : \(name)\nHealth : \(health)/100\nMP : \(mp)/50"
    }
    
    init(mp: Int, health: Int, name: String, multiplier: Int, inventory: [Potion]) {
        self.mp = mp
        self.health = health
        self.name = name
        self.multiplier = multiplier
        self.inventory = inventory
    }
    
    mutating func retreat(monster: Monster) {
        print("")
        print("You feel that if you don't escape soon, you won't be able to continue to fight.")
        print("You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.")
        print("\nYou're safe for now.")
        monster.monsterHealth = 1000
        chance = 2
        multiplier = 1
    }
    
    mutating func heroWin(monster: Monster) {
        print("\nYou defeated the enemy!")
        enemyLoot()
        print("Returning you to the main screen...")
        multiplier = 1
        monster.monsterHealth = 1000
        chance = 2
    }
    
    mutating func scanVital() {
        chance -= 1
        multiplier = Int.random(in: 1...3)
        var scan = ""
        switch multiplier{
        case 1 :
            scan = "torso"
            multiplier = 3
        case 2 :
            scan = "heart"
            multiplier = 5
        case 3 :
            scan = "head"
            multiplier = 10
        default :
            ""
        }
        print("\nYou succesfully scan the \(enemy.monsterName)'s \(scan) vital point. Your damage is now multiplied by \(multiplier)x!")
        print("You got \(chance) chance left to scan the enemy")
    }
}

   
