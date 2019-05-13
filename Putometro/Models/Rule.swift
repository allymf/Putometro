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
    init(title: String, descript: String, status: Bool, votes: [Vote]) {
        self.title = title
        self.descript = descript
        self.status = status
        self.votes = votes
        super.init()
        self.record = CKRecord(recordType: RecordType.rule.rawValue)
    }
}
