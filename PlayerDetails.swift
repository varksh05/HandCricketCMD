//
//  PlayerDetails.swift
//  DataCollection
//
//  Created by Valliyappan on 05/04/20.
//  Copyright © 2020 INdlio. All rights reserved.
//

import Foundation

struct PlayerDetails {
//    var id: String?
    var fullName: String
    var teamDetail: TeamDetails
    var tagNumber: Int
//    var sex: String?
//    var age: Int?
    
    
//    func getPlayerDetails(teamTagNumber: Int) {
//        print("ID           :\t")
//        self.id = readLine()
//        print("Name         :\t")
//        self.fullName = readLine()!
//        print("Sex     (M/F):\t")
//        self.sex = readLine()!
//        self.tagNumber = teamTagNumber
//        print("Age          :\t")
//        self.age = Int(readLine()!)!
//    }
    
    func printPlayerDetails() {
        print("Name             :\t\(fullName)")
        print("Tag Number       :\t\(tagNumber)")
        print("Team Name        :\t\(teamDetail.name)")
        print("Team ShortName   :\t\(teamDetail.shortName)")
    }
}
