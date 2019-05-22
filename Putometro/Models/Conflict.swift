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
    
    var status = 0{
        didSet{
            record.setValue(status, forKey: "status")
        }
    }
    
    override init(){
        super.init()
        self.record = CKRecord(recordType: RecordType.conflict.rawValue)
    }
    
    init(record: CKRecord) {
        super.init()
        self.record = record
        
        //fetching the rageMeasurer record from the reference
        guard let rageMeasurerReference = record["rageMeasurer"] as? CKRecord.Reference  else { return }
        CloudKitWrapper.fetchWithId(recordID: rageMeasurerReference.recordID) { (record, error) in
            if let record = record{
                self.rageMeasurer = RageMeasurer(record: record)
            }
        }
        
        //fetching the creator record from the reference
        guard let creatorReference = record["creator"] as? CKRecord.Reference else { return }
        CloudKitWrapper.fetchWithId(recordID: creatorReference.recordID) { (record, error) in
            if let record = record{
                self.creator = User(record: record)
            }
        }
        
        //fetching the troubleMakers records from the reference list
        guard let troubleMakersReferenceList = record["troubleMakers"] as? [CKRecord.Reference] else { return }
        var troubleMakersRecordIDs = [CKRecord.ID]()
        troubleMakersReferenceList.forEach { (record) in
            troubleMakersRecordIDs.append(record.recordID)
        }
        troubleMakersRecordIDs.forEach { (id) in
            CloudKitWrapper.fetchWithId(recordID: id, completion: { (record, error) in
                if let record = record{
                    self.troubleMakers.append(User(record: record))
                }
            })
        }
        
        //fetching the brokenRules records from the reference list
        guard let brokenRulesReferenceList = record["brokenRules"] as? [CKRecord] else { return }
        var brokenRulesRecordIDs = [CKRecord.ID]()
        brokenRulesReferenceList.forEach { (record) in
            brokenRulesRecordIDs.append(record.recordID)
        }
        brokenRulesRecordIDs.forEach { (id) in
            CloudKitWrapper.fetchWithId(recordID: id, completion: { (record, error) in
                if let record = record{
                    self.brokenRules.append(Rule(record: record))
                }
            })
        }
        
        guard let createdAt = record["createdAt"] as? Date else { return }
        self.createdAt = createdAt
        
        guard let status = record["status"] as? Int else { return }
        self.status = status
        
    }
    
    init(rageMeasurer: RageMeasurer, creator: User, troubleMakers: [User], brokenRules: [Rule], createdAt: Date, status: Int) {
        super.init()

        self.record = CKRecord(recordType: RecordType.conflict.rawValue)
        
        setupRecord(rageMeasurer: rageMeasurer, creator: creator, troubleMakers: troubleMakers, brokenRules: brokenRules, createdAt: createdAt, status: status)
    }
    
    private func setupRecord(rageMeasurer: RageMeasurer, creator: User, troubleMakers: [User], brokenRules: [Rule], createdAt: Date, status: Int){
        self.rageMeasurer = rageMeasurer
        self.creator = creator
        self.troubleMakers = troubleMakers
        self.brokenRules = brokenRules
        self.createdAt = createdAt
        self.status = status
    }
}
