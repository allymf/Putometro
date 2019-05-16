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
    
    var name = String()
    var users = [User]()
    var rules = [Rule]()
    var conflicts = [Conflict]()
    var leaderboard = Leaderboard()
    var rageMeasurer = RageMeasurer()
    
    override init(){
        super.init()
        self.record = CKRecord(recordType: RecordType.team.rawValue)
    }
    
    init(name: String, users: [User], rules: [Rule], conflicts: [Conflict], leaderboard: Leaderboard, rageMeasurer: RageMeasurer, record: CKRecord?) {
        super.init()
        if let record = record{
            self.record = record
        }
        else{
            self.record = CKRecord(recordType: RecordType.team.rawValue)
        }
        setupRecord(name: name, users: users, rules: rules, conflicts: conflicts, leaderboard: leaderboard, rageMeasurer: rageMeasurer)
    }
    
    func setupRecord(name: String, users: [User], rules: [Rule], conflicts: [Conflict], leaderboard: Leaderboard, rageMeasurer: RageMeasurer){
        self.name = name
        self.users = users
        self.rules = rules
        self.conflicts = conflicts
        self.leaderboard = leaderboard
        self.rageMeasurer = rageMeasurer
    }
    
}
