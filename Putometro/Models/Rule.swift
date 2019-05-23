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
    
    init(record: CKRecord) {
        super.init()
        self.record = record
        
        
        var titleAux = String()
        if let title = record["title"] as? String{
            titleAux = title
        }
        
        var descriptAux = String()
        if let descript = record["description"] as? String {
            descriptAux = descript
        }
        
        var statusAux = 0
        if let status = record["status"] as? Int{
            statusAux = status
        }
        
        //fetch Votes
        let votesAux = fetchVotes(record: record)
        
        setupRecord(title: titleAux, descript: descriptAux, status: statusAux, votes: votesAux)
        
        
    }
    
    init(title: String, descript: String, status: Int, votes: [Vote]) {
        super.init()
        
        self.record = CKRecord(recordType: RecordType.rule.rawValue)
        setupRecord(title: title, descript: descript, status: status, votes: votes)
    }
    
    private func setupRecord(title: String, descript: String, status: Int, votes: [Vote]){
        self.title = title
        self.descript = descript
        self.status = status
        self.votes = votes
    }
    
    private func fetchVotes(record : CKRecord) -> [Vote]{
        var votesAux = [Vote]()
        if let votesReferenceList = record["votes"] as? [CKRecord.Reference]{
            var votesIDs = [CKRecord.ID]()
            votesReferenceList.forEach { (record) in
                votesIDs.append(record.recordID)
            }
            votesIDs.forEach { (id) in
                CloudKitWrapper.fetchWithId(recordID: id, completion: { (record, error) in
                    if let record = record{
                        self.votes.append(Vote(record: record))
                    }
                })
            }
        }
        return votesAux
    }
}
