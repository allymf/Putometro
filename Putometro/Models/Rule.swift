//
//  Rule.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

struct Rule {
    
    var title: String{
        didSet{
            record.setValue(title, forKey: "title")
        }
    }
    var description: String{
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
    
    private var record = CKRecord(recordType: RecordType.rule.rawValue)
    
    func getRecord() -> CKRecord{
        return record
    }
    
    mutating func setRecord(record: CKRecord){
        self.record = record
    }
}
