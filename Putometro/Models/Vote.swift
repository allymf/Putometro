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
    
    var status: Bool{
        didSet{
            record.setValue(status, forKey: "status")
        }
    }
    var user: User{
        didSet{
            record.setValue(CKRecord.Reference(record: user.getRecord(), action: .deleteSelf), forKey: "user")
        }
    }
    
    private var record = CKRecord(recordType: RecordType.vote.rawValue)
    
    func getRecord() -> CKRecord{
        return record
    }
    
    mutating func setRecord(record: CKRecord){
        self.record = record
    }
}
