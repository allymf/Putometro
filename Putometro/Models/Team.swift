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
    
    var name = String(){
        didSet{
            record.setValue(name, forKey: "name")
        }
    }
    
    var users = [User](){
        didSet{
            let userReferenceList = users.map { (user) -> CKRecord.Reference in
                user.save()
                return CKRecord.Reference(record: user.getRecord(), action: .deleteSelf)
            }
            record.setValue(userReferenceList, forKey: "users")
        }
    }
    
    var rules = [Rule](){
        didSet{
            let rulesReferenceList = rules.map { (rule) -> CKRecord.Reference in
                rule.save()
                return CKRecord.Reference(record: rule.getRecord(), action: .deleteSelf)
            }
            record.setValue(rulesReferenceList, forKey: "rules")
        }
    }
    
    var conflicts = [Conflict](){
        didSet{
            let conflictsReferenceList = conflicts.map { (conflict) -> CKRecord.Reference in
                conflict.save()
                return CKRecord.Reference(record: conflict.getRecord(), action: .deleteSelf)
            }
            record.setValue(conflictsReferenceList, forKey: "conflicts")
        }
    }
    
    var leaderboard = Leaderboard(){
        didSet{
            leaderboard.save()
            record.setValue(CKRecord.Reference(record: leaderboard.getRecord(), action: .deleteSelf), forKey: "leaderboard")
        }
    }
    
    var rageMeasurer = RageMeasurer(){
        didSet{
            rageMeasurer.save()
            record.setValue(CKRecord.Reference(record: rageMeasurer.getRecord(), action: .deleteSelf), forKey: "rageMeasurer")
        }
    }
    
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
