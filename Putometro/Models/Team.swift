//
//  Team.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

class Team: CloudKitModel {
    
    var name: String
    var users: [User]
    var rules: [Rule]
    var conflicts: [Conflict]
    var leaderboard: Leaderboard
    var rageMeasurer: RageMeasurer
    
    init(name: String, users: [User], rules: [Rule], conflicts: [Conflict], leaderboard: Leaderboard, rageMeasurer: RageMeasurer) {
        self.name = name
        self.users = users
        self.rules = rules
        self.conflicts = conflicts
        self.leaderboard = leaderboard
        self.rageMeasurer = rageMeasurer
        super.init()
        self.record = CKRecord(recordType: RecordType.team.rawValue)
    }
    
}
