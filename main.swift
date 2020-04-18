//
//  main.swift
//  DataCollection

//  Created by Applot on 04/04/20.
//  Copyright © 2020 INdlio. All rights reserved.
//

import Foundation

// Team Details
var cskTeamDetails = TeamDetails(name: "Chennai Super Kings", shortName: "CSK")
var rcbTeamDetails = TeamDetails(name: "Royal Challengers Banglore", shortName: "RCB")
var miTeamDetails = TeamDetails(name: "Mumbai Indians", shortName: "MI")



// Player Details
var cskPlayersDetails: [PlayerDetails] = [
    PlayerDetails(fullName: "csk 1", teamDetail: cskTeamDetails, tagNumber: 1),
    PlayerDetails(fullName: "csk 2", teamDetail: cskTeamDetails, tagNumber: 2),
    PlayerDetails(fullName: "csk 3", teamDetail: cskTeamDetails, tagNumber: 3),
    PlayerDetails(fullName: "csk 4", teamDetail: cskTeamDetails, tagNumber: 4),
    PlayerDetails(fullName: "csk 5", teamDetail: cskTeamDetails, tagNumber: 5),
    PlayerDetails(fullName: "csk 6", teamDetail: cskTeamDetails, tagNumber: 6),
    PlayerDetails(fullName: "csk 7", teamDetail: cskTeamDetails, tagNumber: 7),
    PlayerDetails(fullName: "csk 8", teamDetail: cskTeamDetails, tagNumber: 8),
    PlayerDetails(fullName: "csk 9", teamDetail: cskTeamDetails, tagNumber: 9),
    PlayerDetails(fullName: "csk 10", teamDetail: cskTeamDetails, tagNumber: 10),
    PlayerDetails(fullName: "csk 11", teamDetail: cskTeamDetails, tagNumber: 11),
]
    


var rcbPlayersDetails: [PlayerDetails] = [
    PlayerDetails(fullName: "rcb 1", teamDetail: rcbTeamDetails, tagNumber: 1),
    PlayerDetails(fullName: "rcb 2", teamDetail: rcbTeamDetails, tagNumber: 2),
    PlayerDetails(fullName: "rcb 3", teamDetail: rcbTeamDetails, tagNumber: 3),
    PlayerDetails(fullName: "rcb 4", teamDetail: rcbTeamDetails, tagNumber: 4),
    PlayerDetails(fullName: "rcb 5", teamDetail: rcbTeamDetails, tagNumber: 5),
    PlayerDetails(fullName: "rcb 6", teamDetail: rcbTeamDetails, tagNumber: 6),
    PlayerDetails(fullName: "rcb 7", teamDetail: rcbTeamDetails, tagNumber: 7),
    PlayerDetails(fullName: "rcb 8", teamDetail: rcbTeamDetails, tagNumber: 8),
    PlayerDetails(fullName: "rcb 9", teamDetail: rcbTeamDetails, tagNumber: 9),
    PlayerDetails(fullName: "rcb 10", teamDetail: rcbTeamDetails, tagNumber: 10),
    PlayerDetails(fullName: "rcb 11", teamDetail: rcbTeamDetails, tagNumber: 11),
]

var cskPlayers: [Player] = []
var rcbPlayers: [Player] = []

for cskPlayerDetail in cskPlayersDetails {
    cskPlayers.append(Player(playerDetails: cskPlayerDetail))
}
for rcbPlayerDetail in rcbPlayersDetails {
    rcbPlayers.append(Player(playerDetails: rcbPlayerDetail))
}

var csk = Team(teamDetails: cskTeamDetails, players: cskPlayers)
var rcb = Team(teamDetails: rcbTeamDetails, players: rcbPlayers)

var a = Match(team1: csk, team2: rcb)

a.createNewMatch()
