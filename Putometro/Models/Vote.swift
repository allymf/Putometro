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
    
    var status = 0{
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
    
    init(record: CKRecord) {
        super.init()
        self.record = record
        
        guard let status = record["status"] as? Int else { return }
        self.status = status
        
        guard let user = record["user"] as? CKRecord.Reference else { return }
        CloudKitWrapper.fetchWithId(recordID: user.recordID) { (record, error) in
            if let record = record{
                self.user = User(record: record)
            }
        }
    }
    
    init(status: Int, user: User) {
        super.init()

        self.record = CKRecord(recordType: RecordType.vote.rawValue)
        setupRecord(status: status, user: user)
    }
    
    private func setupRecord(status: Int, user: User){
        self.status = status
        self.user = user
    }
}
