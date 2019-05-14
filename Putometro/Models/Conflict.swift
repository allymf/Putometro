//
//  Conflict.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

class Conflict: CloudKitModel {
    
    var rageMeasurer = RageMeasurer(){
        didSet{
            rageMeasurer.save()
            let rageReference = CKRecord.Reference(record: rageMeasurer.getRecord(), action: .deleteSelf)
            record.setValue(rageReference, forKey: "rageMeasurer")
        }
    }
    var creator = User(){
        didSet{
            creator.save()
            let creatorReference = CKRecord.Reference(record: creator.getRecord(), action: .deleteSelf)
            record.setValue(creatorReference, forKey: "creator")
        }
    }
    var troubleMakers = [User](){
        didSet{
            let troubleMakersReferenceList = troubleMakers.map { (user) -> CKRecord.Reference in
                user.save()
                return CKRecord.Reference(record: user.getRecord(), action: .deleteSelf)
            }
            record.setValue(troubleMakersReferenceList, forKey: "troubleMakers")
        }
    }
    var brokenRules = [Rule](){
        didSet{
            let brokenRulesReferenceList = brokenRules.map { (rule) -> CKRecord.Reference in
                rule.save()
                return CKRecord.Reference(record: rule.getRecord(), action: .deleteSelf)
            }
            record.setValue(brokenRulesReferenceList, forKey: "brokenRules")
        }
    }
    var createdAt = Date(){
        didSet{
            record.setValue(createdAt, forKey: "createdAt")
        }
    }
    var status = false{
        didSet{
            record.setValue(status, forKey: "status")
        }
    }
    
    override init(){
        super.init()
        self.record = CKRecord(recordType: RecordType.conflict.rawValue)
    }
    
    init(rageMeasurer: RageMeasurer, creator: User, troubleMakers: [User], brokenRules: [Rule], createdAt: Date, status: Bool) {
        super.init()
        self.record = CKRecord(recordType: RecordType.conflict.rawValue)
        
        setupRecord(rageMeasurer: rageMeasurer, creator: creator, troubleMakers: troubleMakers, brokenRules: brokenRules, createdAt: createdAt, status: status)
    }
    
    private func setupRecord(rageMeasurer: RageMeasurer, creator: User, troubleMakers: [User], brokenRules: [Rule], createdAt: Date, status: Bool){
        self.rageMeasurer = rageMeasurer
        self.creator = creator
        self.troubleMakers = troubleMakers
        self.brokenRules = brokenRules
        self.createdAt = createdAt
        self.status = status
    }
}
