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
    
    var rageMeasurer: RageMeasurer{
        didSet{
            let rageReference = CKRecord.Reference(record: rageMeasurer.getRecord(), action: .deleteSelf)
            record.setValue(rageReference, forKey: "rageMeasurer")
        }
    }
    var creator: User{
        didSet{
            let creatorReference = CKRecord.Reference(record: creator.getRecord(), action: .deleteSelf)
            record.setValue(creatorReference, forKey: "creator")
        }
    }
    var troubleMakers: [User]{
        didSet{
            let troubleMakersReferenceList = troubleMakers.map { (user) -> CKRecord.Reference in
                return CKRecord.Reference(record: user.getRecord(), action: .deleteSelf)
            }
            record.setValue(troubleMakersReferenceList, forKey: "troubleMakers")
        }
    }
    var brokenRules: [Rule]{
        didSet{
            let brokenRulesReferenceList = brokenRules.map { (rule) -> CKRecord.Reference in
                return CKRecord.Reference(record: rule.getRecord(), action: .deleteSelf)
            }
            record.setValue(brokenRulesReferenceList, forKey: "brokenRules")
        }
    }
    var createdAt: Date{
        didSet{
            record.setValue(createdAt, forKey: "createdAt")
        }
    }
    var status: Bool{
        didSet{
            record.setValue(status, forKey: "status")
        }
    }
    
    override init(){
        self.rageMeasurer = RageMeasurer()
        self.creator = User()
        self.troubleMakers = [User]()
        self.brokenRules = [Rule]()
        self.createdAt = Date()
        self.status = false
        super.init()
        self.record = CKRecord(recordType: RecordType.conflict.rawValue)
    }
}
