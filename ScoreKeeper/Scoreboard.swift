//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Meezotech Mac on 14/01/2026.
//

import Foundation

struct Scoreboard{
    
    var players: [Player] = [
        Player(name: "Anas", score: 3, color: "Green"),
        Player(name: "Ali", score: 6, color: "Green"),
        Player(name: "Ahad", score: 8, color: "Green"),
        Player(name: "Hammad", score: 5, color: "Red")
    ]
    
    var state = GameState.setup
}
