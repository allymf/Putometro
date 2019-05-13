//
//  Rule.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

class Rule: CloudKitModel {
    
    var title: String{
        didSet{
            record.setValue(title, forKey: "title")
        }
    }
    var descript: String{
        didSet{
            record.setValue(description, forKey: "description")
        }
    }
    var status: Bool{
        didSet{
            record.setValue(status, forKey: "status")
        }
    }
    var votes: [Vote]{
        didSet{
            let votesReferenceList = votes.map { (vote) -> CKRecord.Reference in
                return CKRecord.Reference(record: vote.getRecord(), action: .deleteSelf)
            }
            record.setValue(votesReferenceList, forKey: "votes")
        }
    }
    
    override init() {
        self.title = String()
        self.descript = String()
        self.status = false
        self.votes = [Vote]()
        super.init()
        self.record = CKRecord(recordType: RecordType.rule.rawValue)
    }
}
