//
//  Team.swift
//  DataCollection
//
//  Created by Valliyappan on 05/04/20.
//  Copyright © 2020 INdlio. All rights reserved.
//

import Foundation

struct Team {
    
    var teamDetails : TeamDetails
    
    //  Gendral
    var players: [Player]
    init(teamDetails: TeamDetails, players: [Player]) {
        self.teamDetails = teamDetails
        self.players = players
    }
    var runs: Int = 0
    var wickets: Int = 0
    var score: String = "0/0"
    var ballsTaken: Int = 0
    var oversTaken: String = "0"
    var overtotal = 0
    var overDetail = ""
    var requiredRuns: Int = 0
    // Local Count
    var count: [Int] = [0,0,0,0,0,0]
    var matchDetails: [String] = []
}
