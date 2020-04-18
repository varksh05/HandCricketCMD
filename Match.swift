//
//  Match.swift
//  DataCollection
//
//  Created by Valliyappan on 05/04/20.
//  Copyright © 2020 INdlio. All rights reserved.
//

import Foundation

public struct Match {
    
//  MatchProperties
    var team1: Team
    var team2: Team
    var dateOfMatch = Date()
    
    var dateFormatter = DateFormatter()


    func createNewMatch() {
        let choosen = Int.random(in: 0...1)
        let tossChoosen: TossOptions = choosen != 0 ? .odd : .even
        var a = Toss(team1: team1, team2: team2, team2TossOption: tossChoosen)
        dateFormatter.dateFormat = "h:mm a, MMM d yyyy"
        
        print("\(team1.teamDetails.name) vs \(team2.teamDetails.name) - \(dateFormatter.string(from: dateOfMatch))\n")
        a.tossing()
    }
    
}
