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
    var title: String
    var description: String
    //var status: RuleStatus
    var votes: [Vote]
    
    private var record: CKRecord?
    
    func getRecord() -> CKRecord{
        guard let record = record else {
            let votesReferenceList = votes.map { (vote) -> CKRecord.Reference in
                return CKRecord.Reference(record: vote.getRecord(), action: .deleteSelf)
            }
            let values = [
                "title" : title,
                "description" : description,
                "votes" : votesReferenceList
                ] as [String : Any]
            let newRecord = CKRecord(recordType: "Rule")
            newRecord.setValuesForKeys(values)
            return newRecord
        }
        return record
    }
}
