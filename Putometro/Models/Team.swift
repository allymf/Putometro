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
        self.name = String()
        self.users = [User]()
        self.rules = [Rule]()
        self.conflicts = [Conflict]()
        self.leaderboard = Leaderboard()
        self.rageMeasurer = RageMeasurer()
        super.init()
        self.record = CKRecord(recordType: RecordType.team.rawValue)
    }
    
}
