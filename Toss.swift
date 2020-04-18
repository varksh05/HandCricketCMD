//
//  Toss.swift
//  DataCollection
//
//  Created by Valliyappan on 05/04/20.
//  Copyright © 2020 INdlio. All rights reserved.
//

import Foundation

public enum TossOptions: Int {
    case odd = 0
    case even = 1
    
    var result: String {
        switch self {
        case .odd:
            return "Odd"
        case .even:
            return "Even"
        }
    }
}

public enum PlayingOptions: Int {
    case bat = 0
    case bowl = 1
    
    var result: String {
        switch self {
        case .bat:
            return "Bat"
        case .bowl:
            return "Bowl"
        }
    }
}

public struct Toss {
    
    var team1: Team
    var team2: Team
    var team2TossOption: TossOptions
    var newGame: Game?
    
    private let randomNumberOne = Int.random(in: 1...6) //  Chooses From ONE...SIX
    private let randomNumberTwo = Int.random(in: 1...6) //  Chooses From ONE...SIX
    
    // Tossing process Occurs
    public mutating func tossing() {
                
        //  Step 1:  Assign team1 Toss Option
        let team1TossOption: TossOptions = team2TossOption != .even ? .even : .odd
        
        //  Step 2:  Chooses From ZERO...ONE // WONT BE REQUIRED
        let choosen = Int.random(in: 0...1)
        
        print("\(team2.teamDetails.name) has choose \(team2TossOption.result)")

        if (randomNumberOne + randomNumberTwo)%2 != team2TossOption.rawValue {
            
            //  Works when team 1 Wins
            choosing(choosen: choosen, winningteam: team1, loosingTeam: team2, result: team1TossOption)
        } else {
            
            //  Works when team 2 Wins
            choosing(choosen: choosen, winningteam: team2,  loosingTeam: team1, result: team2TossOption)
        }
    }
        
    // Choosing PlayingOptions
    private mutating func choosing(choosen: Int, winningteam: Team, loosingTeam: Team, result: TossOptions) {
        self.newGame =  Game()
        if choosen == PlayingOptions.bat.rawValue {
            
            //  Works when team elects to Bat First
            print("It's \(result.result)")
            print("\(winningteam.teamDetails.name) won the toss and choosed to Bat first\n")
            
            newGame?.Innings(batting: winningteam, bowling: loosingTeam, innings: .first)
        } else {
            
            //  Works when team elects to Bowl First
            print("It's \(result.result)")
            print("\(winningteam.teamDetails.name) won the toss and choosed to Bowl first\n")
            newGame?.Innings(batting: loosingTeam, bowling: winningteam, innings: .first)
        }
        //Call First Innings
    }
}
