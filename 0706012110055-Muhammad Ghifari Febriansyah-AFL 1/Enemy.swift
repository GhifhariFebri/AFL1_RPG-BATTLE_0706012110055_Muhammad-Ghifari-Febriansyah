//
//  Enemy.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 1
//
//  Created by MacBook Pro on 05/04/23.
//

import Foundation
protocol Enemy{
    func meetBoss(chance: Int)
    func enemyTurn(player: Hero)
    func enemyWin(player: Hero)
    func enemyDrop(drop: Potion)
}

