//
//  Player.swift
//  DataCollection
//
//  Created by Valliyappan on 05/04/20.
//  Copyright © 2020 INdlio. All rights reserved.
//

import Foundation

struct Player {
    //  Batting
    var playerDetails : PlayerDetails
    
    init(playerDetails: PlayerDetails) {
        self.playerDetails = playerDetails
    }
    
    //  Batting
    var wicket: Bool = true
    var runsScored: Int = 0
    var ballsFaced: Int = 0
    var wicketTakenBy: PlayerDetails?
    var wicketsFallen: String = ""
    var oversPlayed: String = "0"

    //  Bowlling
    var runsGiven: Int = 0
    var wicketTaken: [Player] = []
    var ballsBowled: Int = 0
    var oversBowled: String = "0"

    //  globalVariable
    var count: [Int] = [0,0,0,0,0,0]

}
