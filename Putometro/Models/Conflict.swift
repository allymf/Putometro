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
    var rageMeasurer: RageMeasurer
    var creator: User
    var troubleMakers: [User]
    var brokenRules: [Rule]
    var createdAt: Date
    //var status: ConflictStatus
    
    private let defaultContainer = CKContainer.default()
    private let publicDb = CKContainer.default().publicCloudDatabase
    
    
    
    
    
    func fetchConflict(){
        let predicate = NSPredicate(format: "", "")
        let query = CKQuery(recordType: "Conflicts", predicate: predicate)
        
        publicDb.perform(query, inZoneWith: nil) { (records, error) in
            //
        }
    }
    
    
    
    
    
    
    func saveConflict(){
        let rageReference = CKRecord.Reference(record: rageMeasurer.getRecord(), action: .deleteSelf)
        let creatorReference = CKRecord.Reference(record: <#T##CKRecord#>, action: .deleteSelf)
        
        let newConflict = CKRecord(recordType: "Conflicts")
        let values = ["rageMeasurer" : rageReference,
                      "creator" : creator,
                      "troubleMakers" : troubleMakers,
                      "brokenRules" : brokenRules,
                      "createdAt" : createdAt] as [String : Any]
        newConflict.setValuesForKeys(values)
        publicDb.save(newConflict) { (record, error) in
            //
        }
    }
    
}
