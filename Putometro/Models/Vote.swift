//
//  Vote.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

struct Vote {
    var status: Bool
    var user: User
    
    private var record: CKRecord?
    
    func getRecord() -> CKRecord{
        guard let record = record else{
            let newRecord = CKRecord(recordType: "Vote")
            newRecord.setValue(CKRecord.Reference(record: user.getRecord(), action: .deleteSelf), forKey: "user")
            newRecord.setValue(status, forKey: "status")
            return newRecord
        }
        return record
    }
    
    mutating func setRecord(record: CKRecord){
        self.record = record
    }
}
