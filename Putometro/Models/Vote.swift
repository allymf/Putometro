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
    
    var status = false{
        didSet{
            record.setValue(status, forKey: "status")
        }
    }
    var user = User(){
        didSet{
            user.save()
            record.setValue(CKRecord.Reference(record: user.getRecord(), action: .deleteSelf), forKey: "user")
        }
    }
    
    override init() {
        super.init()
        self.record = CKRecord(recordType: RecordType.vote.rawValue)
    }
    
    init(status: Bool, user: User, record: CKRecord?) {
        super.init()
        if let record = record{
            self.record = record
        }
        else{
            self.record = CKRecord(recordType: RecordType.vote.rawValue)
        }
        setupRecord(status: status, user: user)
    }
    
    private func setupRecord(status: Bool, user: User){
        self.status = status
        self.user = user
    }
}
