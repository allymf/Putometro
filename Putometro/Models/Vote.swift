//
//  Vote.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

class Vote: CloudKitModel {
    
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
    
    override init() {
        self.status = false
        self.user = User()
        super.init()
        self.record = CKRecord(recordType: RecordType.vote.rawValue)
    }
}
