//
//  Team.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation

struct Team {
    var name: String
    var users: [User]
    var rules: [Rule]
    var conflicts: [Conflict]
    var leaderboard: Leaderboard
    var rageMeasurer: RageMeasurer
    
}
