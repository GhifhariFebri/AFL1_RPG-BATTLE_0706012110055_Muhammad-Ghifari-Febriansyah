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
var chance = 2

var skill = ["Physical Attack. No mana required. Deal 5 pt of damage.", "Meteor. Use 15 points of MP. Deal 50 pt of damage.", "Shield. Use 10 pt of MP. Block enemy's attack for 1 turn."]
var playerName: String = ""
var playerHealth = 100
var playerAttack = 10
var playerMP = 50
var potion = 10
var elixir = 5
var heal: String = ""
var healagain: String = ""
var getHeal = 20
var multiplier = 1
var shield = 0

var mpUsage = [0, 15, 10]

var enemyHealth = 1000
var enemy = ["Golem", "Troll"]
var enemyName = ""

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
    print("\nWelcome, \(playerName) To the magical world!")
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
        battleMenu()
    case "m" :
        battleMenu()
    case "q" :
        print("It was fun while it lasted, young one. See ya around!")
        exit(0)
    default :
        journeyScreen()
    }
}

func healMenu(){
    print("\nYour hp is : \(playerHealth)")
    print("You have \(potion) potions left")
    print("\nAre you sure you want to use 1 potion to heal your wounds? Y/N", terminator: " ")
    heal = readLine()!.lowercased()
    switch heal{
    case "y":
        if(potion <= 0){
            print("\nYou run out of potion!")
            journeyScreen()
        }
        if(playerHealth < 100){
            playerHealth += getHeal
            potion -= 1
            if (playerHealth > 100){
                playerHealth = 100
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
    print("\nYour mana is : \(playerMP)")
    print("You have \(elixir) elixir left")
    print("\nAre you sure you want to use 1 elixir to refill your mana? Y/N", terminator: " ")
    heal = readLine()!.lowercased()
    switch heal{
    case "y":
        if(elixir <= 0){
            print("\nYou run out of elixir!")
            journeyScreen()
        }
        if(playerMP < 50){
            playerMP += 10
            elixir -= 1
            if (playerMP > 50){
                playerMP = 50
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
        print("\nYour HP is now : \(playerHealth)")
        print("You have \(potion) potions left")
        print("\nStill want to use 1 potion to heal your wounds again? Y/N", terminator: " ")
        healagain = readLine()!.lowercased()
        switch healagain{
        case "y":
            if(potion <= 0){
                print("You run out of potion!")
                journeyScreen()
            }
            if (playerHealth < 100){
                playerHealth += getHeal
                potion -= 1
                if(playerHealth > 100){
                    playerHealth = 100
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
        print("\nYour mana is now : \(playerMP)")
        print("You have \(elixir) elixir left")
        print("\nStill want to use 1 elixir to refill your mana again? Y/N", terminator: " ")
        healagain = readLine()!.lowercased()
        switch healagain{
        case "y":
            if(elixir <= 0){
                print("You run out of elixir!")
                journeyScreen()
            }
            if (playerMP < 50){
                playerMP += 10
                elixir -= 1
                if(playerMP > 50){
                    playerMP = 50
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
    print("\nPlayer's name : \(playerName)")
    print("\nHP : \(playerHealth)/100")
    print("MP : \(playerMP)/50")
    print("\nMagic : ")
    for skillName in skill{
        print("- \(skillName)")
    }
    print("\nItems : ")
    print("- Potions x\(potion). Heal 20 pts of your HP")
    print("- Elixir x\(elixir). Add 10 pts to your MP")
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
    switch menuChoice{
    case "m":
        for enemyNama in enemy{
            if(enemyNama == "Golem"){
                print("\nAs you make your way through the rugged mountain terrain, you can feel the chill of wind biting your skin.")
                print("Suddenly, you hear a sound that makes you freeze in the tracks. That's when you see it -  a massive snarling Golem emerging from the shadows.")
                enemyName = enemyNama
                print("\nEnemy : \(enemyName)")
                print("Health: \(enemyHealth)/1000")
            }
        }
        
    case "f":
        for enemyNama in enemy{
            if(enemyNama == "Troll"){
                print("\nAs you enter the forest, you feel a sense of unease wash over you")
                print("Suddenly, you hear the sounds of twigs snapping behind you. You quickly spin around and find a troll emerging from the shadows.")
                enemyName = enemyNama
                print("\nEnemy : \(enemyName)")
                print("Health: \(enemyHealth)/1000")
            }
        }
    default:
        journeyScreen()
    }
    print("\nYour health : \(playerHealth)/100")
    print("Your mana : \(playerMP)/50")
    print("Potion : x\(potion)")
    print("Elixir : x\(elixir)")
    print("\nChoose your action : ")
    var i = 1
    for skillName in skill{
        print("[\(i)] \(skillName)")
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
        print("\nYou attack your enemy using Physical Attack!")
        print("You deal \(5*multiplier) Attack!")
        print("it's very effective!")
        enemyHealth = enemyHealth - 5*multiplier
        if(shield == 1){
            print("\nYou block the enemy's attack for this turn!")
            print("Your shield is gone now!")
            shield -= 1
            battleMenu()
        }
        if(enemyHealth <= 0){
            print("\nYou has defeated the enemy!")
            enemyDrop()
            print("Returning you to the main screen...")
            enemyHealth = 1000
            multiplier = 1
            chance = 2
            journeyScreen()
        }
        enemyAttackFunc()
    case "2" :
        if(playerMP < 15){
            print("You don't have enough MP!")
            battleMenu()
        }
        else{
            playerMP -= 15
            print("\nYou attack your enemy using Meteor Attack!")
            print("You deal \(50*multiplier) Attack!")
            print("it's very effective!")
            enemyHealth = enemyHealth - 50*multiplier
            if(shield == 1){
                print("\nYou block the enemy's attack for this turn!")
                print("Your shield is gone now!")
                shield -= 1
                battleMenu()
            }
            if(enemyHealth <= 0){
                print("\nYou has defeated the enemy!")
                enemyDrop()
                print("Returning you to the main screen...")
                enemyHealth = 1000
                multiplier = 1
                chance = 2
                journeyScreen()
            }
            enemyAttackFunc()
        }
    case "3" :
        if(shield == 1){
            print("\nYou already have your Shield skill up!")
            battleMenu()
        }
        if(playerMP < 10){
            print("You don't have enough MP!")
            battleMenu()
        }
        else{
            playerMP -= 10
            shield += 1
            print("\nYou use Shield!")
            battleMenu()
        }
    case "4" :
        healBattle()
    case "5" :
        manaBattle()
    case "6" :
        var scan = ""
        var randomVital = Int.random(in: 1...3)
        switch randomVital{
        case 1 :
            multiplier = 2
            scan = "torso"
        case 2 :
            multiplier = 5
            scan = "heart"
        case 3 :
            multiplier = 10
            scan = "head"
        default :
            ""
        }
        chance -= 1
        print("\nYou succesfully scan the \(enemyName)'s \(scan) vital point. Your damage is now multiplied by \(multiplier)x!")
        print("You got \(chance) chance left to scan the enemy")
        battleMenu()
    case "7" :
        fleeBattle()
    default:
        battleMenu()
    }
}
func enemyDrop(){
    var randomelix = Int.random(in: 1...10)
    elixir += randomelix
    var randomheal = Int.random(in: 1...15)
    potion += randomheal
    print("The enemy drops you \(randomelix)x elixir and \(randomheal)x healing potion. Use them in your next battle!")
}

func fleeBattle(){
    print("\nYou feel that if you don't escape soon, you won't be able to continue to fight.")
    print("You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.")
    print("\nYou're safe for now.")
    enemyHealth = 1000
    chance = 2
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
        print("\nYour hp is : \(playerHealth)")
        print("You have \(potion) potions left")
        print("\nWant to use 1 potion to heal your wounds again? Y/N", terminator: " ")
        heal = readLine()!.lowercased()
        switch heal{
        case "y":
            if(potion <= 0){
                print("\nYou run out of potion!")
                battleMenu()
            }
            if (playerHealth < 100){
                playerHealth += getHeal
                potion -= 1
                if(playerHealth > 100){
                    playerHealth = 100
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
        print("\nYour mana is : \(playerMP)")
        print("You have \(elixir) elixir left")
        print("\nStill want to use 1 elixir to refill your mana again? Y/N", terminator: " ")
        healagain = readLine()!.lowercased()
        switch healagain{
        case "y":
            if(elixir <= 0){
                print("\nYou run out of elixir!")
                battleMenu()
            }
            if (playerMP < 50){
                playerMP += 10
                elixir -= 1
                if(playerMP > 50){
                    playerMP = 50
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
    var randomAtt = Int.random(in: 5...10)
    playerHealth -= randomAtt
    print("\nThe enemy \(enemyName) attack you for \(randomAtt) damage")
    if (playerHealth <= 0){
        print("The enemy \(enemyName) defeated you!")
        print("Returning you to the main menu...")
        playerHealth = 20
        playerMP = 10
        enemyHealth = 1000
        multiplier = 1
        chance = 2
        journeyScreen()
    }else{
        battleMenu()
    }
    
}







