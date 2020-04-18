//
//  Result.swift
//  DataCollection
//
//  Created by Valliyappan on 07/04/20.
//  Copyright © 2020 INdlio. All rights reserved.
//

import Foundation

struct Result {
    var team1: Team
    var team2: Team
    
    
    mutating func displayResult() -> String {
        if self.team1.runs !=  self.team2.runs {
            if self.team1.runs >  self.team2.runs {
                return "\n\(team1.teamDetails.name) won by \(self.team1.runs - self.team2.runs) \(self.team1.runs - self.team2.runs > 1 ? "runs" : "run")"
            } else {
                return "\n\(team2.teamDetails.name) won by \(5 - self.team2.wickets) \(5 - self.team2.wickets > 1 ? "wickets" : "wicket")"
            }
        } else {
            return ("\nThe Match is Tie")
        }
    }
}
