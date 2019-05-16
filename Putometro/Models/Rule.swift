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
    
    var title = String(){
        didSet{
            record.setValue(title, forKey: "title")
        }
    }
    var descript = String(){
        didSet{
            record.setValue(description, forKey: "description")
        }
    }
    var status = 0{
        didSet{
            record.setValue(status, forKey: "status")
        }
    }
    var votes = [Vote](){
        didSet{
            let votesReferenceList = votes.map { (vote) -> CKRecord.Reference in
                vote.save()
                return CKRecord.Reference(record: vote.getRecord(), action: .deleteSelf)
            }
            record.setValue(votesReferenceList, forKey: "votes")
        }
    }
    
    override init() {
        super.init()
        self.record = CKRecord(recordType: RecordType.rule.rawValue)
    }
    
    init(title: String, descript: String, status: Int, votes: [Vote], record: CKRecord?) {
        super.init()
        if let record = record{
            self.record = record
        }
        else{
            self.record = CKRecord(recordType: RecordType.rule.rawValue)
        }
        setupRecord(title: title, descript: descript, status: status, votes: votes)
    }
    
    private func setupRecord(title: String, descript: String, status: Int, votes: [Vote]){
        self.title = title
        self.descript = descript
        self.status = status
        self.votes = votes
    }
}
