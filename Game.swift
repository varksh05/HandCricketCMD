//
//  Game.swift
//  DataCollection
//
//  Created by Valliyappan on 06/04/20.
//  Copyright © 2020 INdlio. All rights reserved.
//

import Foundation


public enum InningsOptions: Int {
    case first = 1
    case second = 2
    
    var result: String {
        switch self {
        case .first:
            return "First"
        case .second:
            return "Second"
        }
    }
}

public struct Game {
    
    var battingTeam: Team?
    var bowlingTeam: Team?
    var result: Result?
    
    var status: String = "Match is not yet Started"
    
    var currentBowlingPlayer: Int = 0
    
    
    // 2nd innings Only
    internal var target: Int?
    internal var targetScore: String?
    
    private func scoreSpliter(score: String) -> [Int] {
        score.split(separator: "/").map{ (n) -> Int in
            Int(n)!
        }
    }
    
    private func ballsToOvers(totalballs: Int) -> String {
        "\(totalballs/6)\(String(totalballs%6) != "0" ? "."+String(totalballs%6): "")\(totalballs/6 <= 10 || totalballs%6 == 0  ? "\t": "")"
    }
    
    private func ballsToOversNoTab(totalballs: Int) -> String {
        "\(totalballs/6)\(String(totalballs%6) != "0" ? "."+String(totalballs%6): "")"
    }
    
    private func scoreConvertor(runs: Int, wickets: Int) -> String {
        "\(runs)/\(wickets)"
    }
    
    private func requiredRunsCalc(runs: Int, target: Int, innings: InningsOptions) -> Int{
        innings != .second ? 0 : target > runs ? target - runs : 0
    }
    
    private func changeBowlingPlayer(currentBowler: Int) -> Int {
        let newBowler = Int.random(in: 1...(self.bowlingTeam!.players.count - 1))
        return currentBowler != newBowler ? newBowler : newBowler - 1    }
    
    mutating func Innings(batting: Team, bowling: Team, innings: InningsOptions) {
        battingTeam = batting
        bowlingTeam = bowling
        currentBowlingPlayer = changeBowlingPlayer(currentBowler: currentBowlingPlayer)
        
        if innings == .first {
            
            // First Innings
            print("\(innings.result) Innings")
            print("\nBatting Team  : \(self.battingTeam!.teamDetails.shortName)\nBowling Team  : \(self.bowlingTeam!.teamDetails.shortName)\n")
            
            //  Calculating Score
            while battingTeam!.wickets < battingTeam!.players.count  {
                scoreCalc(run: Int.random(in: 0...6), target: 0, innings: innings)
            }
            
            //  Display Over Board
            print("First Innings Overs Board")
            print("-------------------------------------------------------------------------------")
            print("Players\t\t\tOvers\t\tOverTotal\tTotalScores\t\tOverDetails")
            print("-------------------------------------------------------------------------------")
            for matchDetail in battingTeam!.matchDetails {
                print(matchDetail)
            }
            print("-------------------------------------------------------------------------------\n\n")
            
            //  Display Bat's Man Score Board
            print("Bat's Man's Score Board")
            print("----------------------------------------------------------------------------------")
            print("Players\t\t\tRuns\t\tBallsPlayed\t\tScore\t\tOver\t\tWicketTakenBy")
            print("----------------------------------------------------------------------------------")
            for player in battingTeam!.players {
                print("\(player.playerDetails.fullName)\t\t\(player.runsScored)\t\t\t\(player.ballsFaced)\t\t\t\t\(player.wicketsFallen)\t\t\t\(player.wicketTakenBy!.fullName)")
            }
            print("----------------------------------------------------------------------------------\n\n")
            
            //  Display Bowler's Score Board
            print("Bolwer's Score Board")
            print("----------------------------------------------------------")
            print("Players\t\t\tOversBowled\t\tWicketTaken\t\tRunsGiven")
            print("----------------------------------------------------------")
            for player in bowlingTeam!.players {
                if player.ballsBowled != 0 {
                    print("\(player.playerDetails.fullName)\t\t\t\(player.oversBowled)\t\t\t\t\(player.wicketTaken.count)\t\t\t\(player.runsGiven)")
                }
            }
            print("----------------------------------------------------------\n")
            
            //  Final Score
            print("\n\(battingTeam!.teamDetails.shortName) : \( battingTeam!.score) in \(ballsToOversNoTab(totalballs: battingTeam!.ballsTaken)) overs")
            
            //  End of First Innings
            self.status = "End of First Innings"
            self.target = battingTeam!.runs + 1
            
            //  Calling Second Innings
            Innings(batting: self.bowlingTeam!, bowling: self.battingTeam!, innings: .second)
        }
        else {
            

            //  Second Innings
            print("\n\(innings.result) Innings")
            print("\nBatting Team  : \(self.battingTeam!.teamDetails.shortName)\nBowling Team  : \(self.bowlingTeam!.teamDetails.shortName)\n")
            
            print("\nThe target is \(target!)\n")

            // Calculating Score for bowling team
            while battingTeam!.wickets < battingTeam!.players.count && battingTeam!.runs <= bowlingTeam!.runs {
                scoreCalc(run: Int.random(in: 0...6), target: target!, innings: innings)
            }
            
            //  Display Over Board
            print("Second Innings Overs Board")
            print("----------------------------------------------------------------------------------------------")
            print("Players\t\t\tOvers\t\tOverTotal\tTotalScores\t\tRequiredRun\t\tOverDetails")
            print("----------------------------------------------------------------------------------------------")
            for matchDetail in battingTeam!.matchDetails {
                print(matchDetail)
            }
            print("----------------------------------------------------------------------------------------------\n\n")

            //  Display Bat's Man Score Board
            print("Bat's Man's Score Board")
            print("----------------------------------------------------------------------------------")
            print("Players\t\t\tRuns\t\tBallsPlayed\t\tScore\t\tOver\t\tWicketTakenBy")
            print("----------------------------------------------------------------------------------")
            for player in battingTeam!.players {
                if player.ballsFaced != 0 {
                    print("\(player.playerDetails.fullName)\t\t\(player.runsScored)\t\t\t\(player.ballsFaced)\t\t\t\t\(player.wicketsFallen)\t\t\t\(player.wicket ? "Not Out": player.wicketTakenBy!.fullName)")
                }
            }
            print("----------------------------------------------------------------------------------\n\n")
            
            //  Display Bowler's Score Board
            print("Bolwer's Score Board")
            print("----------------------------------------------------------")
            print("Players\t\t\tOversBowled\t\tWicketTaken\t\tRunsGiven")
            print("----------------------------------------------------------")
            for player in bowlingTeam!.players {
                if player.ballsBowled != 0 {
                    print("\(player.playerDetails.fullName)\t\t\t\(player.oversBowled)\t\t\t\t\(player.wicketTaken.count)\t\t\t\(player.runsGiven)")
                }
            }
            print("----------------------------------------------------------\n\n")
            //  Final Score
            print("\n\(battingTeam!.teamDetails.shortName) : \( battingTeam!.score) in \(ballsToOversNoTab(totalballs: battingTeam!.ballsTaken)) overs")

            //  End of the Match
            result = Result(team1: bowlingTeam!, team2: battingTeam!)
            self.status = result!.displayResult()
            print(status)
            
        }
    }
    
    mutating func scoreCalc(run: Int, target: Int, innings: InningsOptions) {
        
        //  Batting Player
        self.battingTeam!.players[battingTeam!.wickets].ballsFaced += 1
        
        //  Bowling Player
        self.bowlingTeam!.players[currentBowlingPlayer].ballsBowled += 1
        
        //  Batting Team
        self.battingTeam!.ballsTaken += 1
        
        //  Calculating Overs
        self.battingTeam!.players[battingTeam!.wickets].oversPlayed = ballsToOvers(totalballs: self.battingTeam!.players[battingTeam!.wickets].ballsFaced)
        self.bowlingTeam!.players[currentBowlingPlayer].oversBowled = ballsToOvers(totalballs: self.bowlingTeam!.players[currentBowlingPlayer].ballsBowled)
        self.battingTeam!.oversTaken = ballsToOvers(totalballs: self.battingTeam!.ballsTaken)
        self.battingTeam!.overtotal += run
        switch run {
        case 1...6:
            
            //  Batting Player
            self.battingTeam!.players[battingTeam!.wickets].runsScored += run
            self.battingTeam!.players[battingTeam!.wickets].count[run - 1] += 1
            self.battingTeam!.players[battingTeam!.wickets].wicketsFallen = "\(battingTeam!.score)\(battingTeam!.runs<9 ? "\t": "")\t\t\(battingTeam!.oversTaken)"

            
            //  Bowling Player
            self.bowlingTeam!.players[self.currentBowlingPlayer].runsGiven += run
            
            //  Batting Team
            self.battingTeam!.runs += run
            self.battingTeam!.count[run - 1] += 1
            
            //  Over
            self.battingTeam!.overDetail += "\(run)\t"
            self.battingTeam!.requiredRuns = self.requiredRunsCalc(runs: self.battingTeam!.runs, target: target, innings: innings)
            self.battingTeam!.score = self.scoreConvertor(runs: self.battingTeam!.runs, wickets: self.battingTeam!.wickets)
        default:
            //  Batting Player
            self.battingTeam!.players[battingTeam!.wickets].wicket = false
            self.battingTeam!.players[battingTeam!.wickets].wicketTakenBy = self.bowlingTeam!.players[self.currentBowlingPlayer].playerDetails
            self.battingTeam!.players[battingTeam!.wickets].wicketsFallen = "\(battingTeam!.score)\(battingTeam!.runs<9 ? "\t": "")\t\t\(battingTeam!.oversTaken)"
            
            //  Bowling Player
            self.bowlingTeam!.players[self.currentBowlingPlayer].wicketTaken.append(self.battingTeam!.players[battingTeam!.wickets])
            
            //  Batting Team
            self.battingTeam!.wickets += 1
            
            //  Over
            self.battingTeam!.overDetail += "W\t"
            self.battingTeam!.score = self.scoreConvertor(runs: self.battingTeam!.runs, wickets: self.battingTeam!.wickets)
        }
        
        if innings != .second {
            if battingTeam!.ballsTaken % 6 == 0 || battingTeam!.wickets == battingTeam!.players.count {
                battingTeam!.matchDetails.append("\(bowlingTeam!.players[currentBowlingPlayer].playerDetails.fullName)\t\t\(battingTeam!.oversTaken)\t\t\t\(battingTeam!.overtotal)\t\t\t\(battingTeam!.score)\t\t\t\(battingTeam!.overDetail) ")
                self.battingTeam!.overDetail = ""
                self.battingTeam!.overtotal = 0
            }
        } else {
            if battingTeam!.ballsTaken % 6 == 0 || battingTeam!.wickets == battingTeam!.players.count || battingTeam!.runs >= target {
                battingTeam!.matchDetails.append("\(bowlingTeam!.players[currentBowlingPlayer].playerDetails.fullName)\t\t\(battingTeam!.oversTaken)\t\t\t\(battingTeam!.overtotal)\t\t\t\(battingTeam!.score)\t\t\t\(battingTeam!.requiredRuns)\t\t\t\t\(battingTeam!.overDetail) ")
                self.battingTeam!.overDetail = ""
                self.battingTeam!.overtotal = 0
            }
        }
        
        if battingTeam!.ballsTaken % 6 == 0 {
                   self.currentBowlingPlayer = changeBowlingPlayer(currentBowler: currentBowlingPlayer)
        }
    }
}

