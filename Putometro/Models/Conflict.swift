//
//  Conflict.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

struct Conflict {
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
    //var status: ConflictStatus
    
    private let defaultContainer = CKContainer.default()
    private let publicDb = CKContainer.default().publicCloudDatabase
    private var record = CKRecord(recordType: RecordType.conflict.rawValue)
    
    func update(recordId: CKRecord.ID){
        publicDb.save(record) { (_, _) in
            //NAO SEI SE TEM ALGUMA COISA QUE QUEREMOS FAZER QUANDO DERMOS UPDATE
        }
    }
    
    
    func create(completion: ((CKRecord) -> Void)? = nil){
        publicDb.save(record) { (record, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            guard let record = record else { return }
            if let completion = completion{
                completion(record)
            }
        }
    }
}
