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

var playerName: String = ""
var playerHealth = 50
var playerAttack = 10
var playerDefense = 5
var potion = 20
var heal: String = ""
var healagain: String = ""
var getHeal = 20

var enemyHealth = 1000
var enemyAttack = 8
var enemyDefense = 3

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

func journeyScreen(){
    print("\nWelcome, \(playerName) To the magical world!")
    print("From here, you can...")
    print("\n[C]heck your health and stats")
    print("[H]eal your wounds with potion")
    print("\nor choose where you want to go..")
    print("\n[F]orest of Troll")
    print("[M]ountain of Golem")
    print("[Q]uit Game")
    userChoice()
}

func userChoice(){
    repeat{
        print("\nYour Choice?", terminator: " ")
        menuChoice = readLine()!.lowercased()
        if (menuChoice == "c"){
            checkStats()
        }
        else if(menuChoice == "h"){
            healMenu()
        }
        else if(menuChoice == "f"){
            forestBattle()
        }
        else if(menuChoice == "m"){
            mountainBattle()
        }
        else if(menuChoice == "q"){
            print("It was fun while it lasted, young one. See ya around!")
            exit(0)
        }
        else{
            correctChoice = false
            print("\nThat's not the correct input, young one!")
        }
    }while(correctChoice == false)
}

func healMenu(){
    print("Your hp is 50")
    print("You have \(potion) potions left")
    print("\nAre you sure you want to use 1 potion to heal your wounds? Y/N", terminator: " ")
    heal = readLine()!
    switch heal{
    case "y":
        if(playerHealth < 100){
            playerHealth += getHeal
            potion -= 1
            if (playerHealth > 100){
                playerHealth = 100
            }
            repeat{
                print("\nYour HP is now: \(playerHealth)")
                print("You have \(potion) potions left")
                print("\nStill want to use 1 potion to heal your wounds again? Y/N", terminator: " ")
                healagain = readLine()!.lowercased()
            switch healagain{
            case "y":
                if (playerHealth < 100){
                    playerHealth += getHeal
                    potion -= 1
                    if(playerHealth > 100){
                        playerHealth = 100
                    }
                }
            case "n":
                journeyScreen()
            default:
                healMenu()
            }
            }while(healagain == "y")
                
                }
        else{
            print("You already have full hp, please use your healing potion wisely!")
        }
    case "n":
        journeyScreen()
    default:
        healMenu()
    }
}

func checkStats(){
    
}

func forestBattle(){
    print("\nAs you enter the forest, you feel unease, suddenly")
    print("Enemy: Orc")
    print("Health: \(enemyHealth)")
    print("\nChoose your action : ")
    print("")
}

func mountainBattle(){
    
}

func isAlphabet(input: String) -> Bool {
    let letters = CharacterSet.letters
    return input.rangeOfCharacter(from: letters.inverted) == nil
}
// Define the function for player attack
func playerAttackFunc() {
    let damage = playerAttack - enemyDefense
    enemyHealth -= damage
    print("Player attacks with \(playerAttack) damage and the enemy takes \(damage) damage!")
    if enemyHealth <= 0{
        enemyHealth = 0
    }
    print("Enemy health: \(enemyHealth)")
}

// Define the function for enemy attack
func enemyAttackFunc() {
    let damage = enemyAttack - playerDefense
    playerHealth -= damage
    print("Enemy attacks with \(enemyAttack) damage and the player takes \(damage) damage!")
    if playerHealth <= 0{
        playerHealth = 0
    }
    print("Player health: \(playerHealth)")
    
}

// Define the main game loop
func gameLoop() {
    while playerHealth > 0 && enemyHealth > 0 {
        playerAttackFunc()
        if enemyHealth <= 0 {
            print("Player wins!")
            break
        }
        enemyAttackFunc()
        if playerHealth <= 0 {
            print("Enemy wins!")
            break
        }
    }
}

// Start the game







