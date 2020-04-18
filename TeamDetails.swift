//
//  TeamDetails.swift
//  DataCollection
//
//  Created by Valliyappan on 05/04/20.
//  Copyright © 2020 INdlio. All rights reserved.
//

import Foundation

struct TeamDetails {
//    let id: String
    let name: String
    let shortName: String
//    let extra: Int
//    let logo: Image
    
    init(name: String, shortName: String) {
        self.name = name
        self.shortName = name
    }
}
