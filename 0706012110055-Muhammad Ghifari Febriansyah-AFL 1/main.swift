//
//  main.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var returnContinue: String = ""
var menuChoice:String = ""
var correctChoice: Bool = true
var battle = ""
var playerName: String = ""
var heal: String = ""
var healagain: String = ""


var hero = Hero(mp: 0, health: 0, name: "", multiplier: 1, inventory: [])
var phys = Attack(skillName: "Physical Attack", mpUsage: 0, skillDesc: "Physical Attack. No mana required. Deal 5 pt of damage.", damage: 5)
var meteor = Attack(skillName: "Meteor", mpUsage: 15, skillDesc: "Meteor. Use 15 points of MP. Deal 50 pt of damage.", damage: 50)
var shield1 = Shield(skillName: "Shield", mpUsage: 10, skillDesc: "Shield. Use 10 pt of MP. Block enemy's attack for 1 turn.", turn: 0)
var skill = [phys, meteor, shield1]
var health_pot = Health_Potion("Health Potion", amount: 10, potionDesc: "Heal 20 pts of your HP")
var mana_pot = Mana_Potion("Elixir Potion", amount: 5, potionDesc: "Restore 10 pts of your MP")
var enemy = Monster(monsterAttack: 0, monsterHealth: 0, monsterName: "", monDrop: 0, monsterType: "")

welcomeScreen()

func welcomeScreen(){
    print("Welcome to the world of magic")
    print("")
    print("You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of arcane arts. Your adventure will take you through the forests, mountains, and dungeons, where you will face challenges, make allies, and fight enemies!")
    print("")
    print("press [return] to continue", terminator: " ")
    returnContinue = readLine()!
    
    switch returnContinue{
    case "":
        gameStart()
    default:
        print("")
        welcomeScreen()
    }
}

func gameStart(){

    repeat{
        print("\nMay i know your name young Wizard?", terminator: " ")
        playerName = readLine()!
        if isAlphabet(input: playerName) && !playerName.isEmpty  {
            hero = Hero(mp: 50, health: 100, name:  playerName, multiplier: 1, inventory: [health_pot, mana_pot])
            journeyScreen()
        }
        else{
            print("\nPlease do not input an empty name or a name with numbers, young one!")
        }
    }while (!isAlphabet(input: playerName) || playerName.isEmpty)
}

func isAlphabet(input: String) -> Bool {
    let letters = CharacterSet.letters
    return input.rangeOfCharacter(from: letters.inverted) == nil
}

func journeyScreen(){
    print("\nWelcome, \(hero.name) To the magical world!")
    print("From here, you can...")
    print("\n[C]heck your health and stats")
    print("[H]eal your wounds with potion")
    print("[U]se Elixir to refill mana")
    print("\nor choose where you want to go..")
    print("\n[F]orest of Troll")
    print("[M]ountain of Golem")
    print("[Q]uit Game")
    userChoice()
}

func userChoice(){
    print("\nYour Choice?", terminator: " ")
        menuChoice = readLine()!.lowercased()
    switch menuChoice{
    case "c" :
        checkStats()
    case "h" :
        healMenu()
    case "u" :
        manaMenu()
    case "f" :
        enemy.monsterDescription = "\nAs you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sounds of twigs snapping behind you. You quickly spin around and find a troll emerging from the shadows"
        enemy.monsterName = "Troll"
        var randomize = Int.random(in: 1...100)
        enemy.meetBoss(chance: randomize)
        battleMenu()
    case "m" :
        enemy.monsterDescription = "\nAs you make your way through the rugged mountain terrain, you can feel the chill of wind biting your skin. Suddenly, you hear a sound that makes you freeze in the tracks. That's when you see it -  a massive snarling Golem emerging from the shadows."
        enemy.monsterName = "Golem"
        var randomize = Int.random(in: 1...100)
        enemy.meetBoss(chance: randomize)
        print("")
        print(enemy.printMonster)
        battleMenu()
    case "q" :
        print("It was fun while it lasted, young one. See ya around!")
        exit(0)
    default :
        journeyScreen()
    }
}

func healMenu(){
    print("\nYour hp is : \(hero.health)")
    print("You have \(health_pot.amount) potions left")
    print("\nAre you sure you want to use 1 potion to heal your wounds? Y/N", terminator: " ")
    heal = readLine()!.lowercased()
    switch heal{
    case "y":
        if(health_pot.amount <= 0){
            print("\nYou run out of potion!")
            journeyScreen()
        }
        if(hero.health < 100){
            health_pot.useItem(player: hero)
            if (hero.health > 100){
                hero.health = 100
                healAgain()
            }
            else{
                healAgain()
            }
                }
        else{
            print("\nYou already have full hp, please use your healing potion wisely!")
            journeyScreen()
        }
    case "n":
        journeyScreen()
    default:
        healMenu()
    }
}

func manaMenu(){
    print("\nYour mana is : \(hero.mp)")
    print("You have \(mana_pot.amount) elixir left")
    print("\nAre you sure you want to use 1 elixir to refill your mana? Y/N", terminator: " ")
    heal = readLine()!.lowercased()
    switch heal{
    case "y":
        if(mana_pot.amount <= 0){
            print("\nYou run out of elixir!")
            journeyScreen()
        }
        if(hero.mp < 50){
            mana_pot.useItem(player: hero)
            if (hero.mp > 50){
                hero.mp = 50
                manaAgain()
            }
            else{
                manaAgain()
            }
                }
        else{
            print("\nYou already have full mana, please use your elixir wisely!")
            journeyScreen()
        }
    case "n":
        journeyScreen()
    default:
        manaMenu()
    }
}

func healAgain(){
    repeat{
        print("\nYour HP is now : \(hero.health)")
        print("You have \(health_pot.amount) potions left")
        print("\nStill want to use 1 potion to heal your wounds again? Y/N", terminator: " ")
        healagain = readLine()!.lowercased()
        switch healagain{
        case "y":
            if(health_pot.amount <= 0){
                print("You run out of potion!")
                journeyScreen()
            }
            if (hero.health < 100){
                health_pot.useItem(player: hero)
                if(hero.health > 100){
                    hero.health = 100
                }
            }
            else{
                print("\nYou already have full hp, please use your healing potion wisely!")
                journeyScreen()
            }
        case "n":
            journeyScreen()
        default:
            healAgain()
        }
    }while(healagain == "y")
}

func manaAgain(){
    repeat{
        print("\nYour mana is now : \(hero.mp)")
        print("You have \(mana_pot.amount) elixir left")
        print("\nStill want to use 1 elixir to refill your mana again? Y/N", terminator: " ")
        healagain = readLine()!.lowercased()
        switch healagain{
        case "y":
            if(mana_pot.amount <= 0){
                print("You run out of elixir!")
                journeyScreen()
            }
            if (hero.mp < 50){
                hero.mp += 10
                mana_pot.amount -= 1
                if(hero.mp > 50){
                    hero.mp = 50
                }
            }
            else{
                print("\nYou already have full mana, please use your elixir wisely!")
                journeyScreen()
            }
        case "n":
            journeyScreen()
        default:
            manaAgain()
        }
    }while(healagain == "y")
}

func checkStats(){
    print(hero.printHero)
    print("\nMagic : ")
    for skillName in skill{
        print(skillName.printSKill)
    }
    
    print("\nItems : ")
    for pot in hero.inventory{
        print(pot.printPotion)
    }
    print("\nPress [return] to go back : ", terminator: " ")
    returnContinue = readLine()!
    switch returnContinue{
    case "":
        journeyScreen()
    default:
        checkStats()
    }
}

func battleMenu(){
    print(enemy.monsterDescription)
    print()
    print(enemy.printMonster)
    print(hero.printHero)
    for allpot in hero.inventory{
        print("\(allpot.potionName) : \(allpot.amount)x")
    }
    print("\nChoose your action : ")
    var i = 1
    for skillName in skill{
        print("[\(i)] \(skillName.skillDesc)")
        i = i+1
    }
    print("\n[4] Use Potion to heal wounds.")
    print("[5] Use elixir to refill mana.")
    print("[6] Scan enemy's vital.")
    print("[7] Flee from battle.")
    battleChoice()
}

func battleChoice(){
    print("\nYour Choice?", terminator: " ")
    battle = readLine()!
    switch battle{
    case "1" :
        phys.useSKill(player: hero, monster: enemy)
        if(shield1.turn == 1){
            shield1.isUp()
        }
        if(enemy.monsterHealth <= 0){
            hero.heroWin(monster: enemy)
            journeyScreen()
        }
        enemyAttackFunc()
    case "2" :
        if(hero.mp < meteor.mpUsage){
            print("You don't have enough MP!")
            battleMenu()
        }
        else{
            meteor.useSKill(player: hero, monster: enemy)
            if(shield1.turn == 1){
                shield1.isUp()
            }
            if(enemy.monsterHealth <= 0){
                hero.heroWin(monster: enemy)
                journeyScreen()
            }
            enemyAttackFunc()
        }
    case "3" :
        if(shield1.turn == 1){
            print("\nYou already have your Shield skill up!")
            battleMenu()
        }
        if(hero.mp < 10){
            print("You don't have enough MP!")
            battleMenu()
        }
        else{
            shield1.useSKill(player: hero, monster: enemy)
            battleMenu()
        }
    case "4" :
        healBattle()
    case "5" :
        manaBattle()
    case "6" :
        if (hero.chance <= 0){
            print("\nYou run out of chance to scan the enemy's vital!")
            battleMenu()
        }
        hero.scanVital()
        battleMenu()
    case "7" :
        fleeBattle()
    default:
        battleMenu()
    }
}
func enemyLoot(){
    enemy.enemyDrop(drop: mana_pot)
    let randomelix = enemy.monDrop
    enemy.enemyDrop(drop: health_pot)
    var randomheal = enemy.monDrop
    print("The enemy drops you \(randomelix)x elixir and \(randomheal)x healing potion. Use them in your next battle!")
}

func fleeBattle(){
    hero.retreat(monster: enemy)
    print("\npress [return] to continue", terminator: " ")
    returnContinue = readLine()!
    switch returnContinue{
    case "":
        journeyScreen()
    default:
        fleeBattle()
    }
}

func healBattle(){
    repeat{
        print("\nYour hp is : \(hero.health)")
        print("You have \(health_pot.amount) potions left")
        print("\nWant to use 1 potion to heal your wounds? Y/N", terminator: " ")
        heal = readLine()!.lowercased()
        switch heal{
        case "y":
            if(health_pot.amount <= 0){
                print("\nYou run out of potion!")
                battleMenu()
            }
            if (hero.health < 100){
                health_pot.useItem(player: hero)
                if(hero.health > 100){
                    hero.health = 100
                    healBattle()
                }
            }
            else{
                print("\nYou already have full hp, please use your healing potion wisely!")
                battleMenu()
            }
        case "n":
            battleMenu()
        default:
            healBattle()
        }
    }while(heal == "y")
}

func manaBattle(){
    repeat{
        print("\nYour mana is : \(hero.mp)")
        print("You have \(mana_pot.amount) elixir left")
        print("\nWant to use 1 elixir to refill your mana? Y/N", terminator: " ")
        healagain = readLine()!.lowercased()
        switch healagain{
        case "y":
            if(mana_pot.amount <= 0){
                print("\nYou run out of elixir!")
                battleMenu()
            }
            if (hero.mp < 50){
                mana_pot.useItem(player: hero)
                if(hero.mp > 50){
                    hero.mp = 50
                }
            }
            else{
                print("\nYou already have full mana, please use your elixir wisely!")
                battleMenu()
            }
        case "n":
            battleMenu()
        default:
            manaBattle()
        }
    }while(healagain == "y")
}

func enemyAttackFunc() {
    enemy.enemyTurn(player: hero)
    if (hero.health <= 0){
    enemy.enemyWin(player: hero)
        journeyScreen()
    }else{
        battleMenu()
    }
    
}







