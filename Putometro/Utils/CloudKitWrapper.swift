//
//  CloudKitWrapper.swift
//  Putometro
//
//  Created by Adauto Pinheiro on 09/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

enum RecordType: String{
    case team = "Team"
    case user = "User"
    case rule  = "Rule"
    case vote = "Vote"
    case conflict = "Conflict"
    case rageMeasurer = "RageMeasurer"
    case leaderboard = "Leaderboard"
}

enum Filter{
    case byName(_: String)
    case byTitle(_: String)
    
    var predicate: NSPredicate{
        switch self {
        case .byName(let name):
            return NSPredicate(format: "name == %@", name)
        case .byTitle(let title):
            return NSPredicate(format: "title == %@", title)
        default:
            return NSPredicate(value: true)
        }
    }
}

class CloudKitWrapper: NSObject{
    
    static private let container = CKContainer.default()
    static private let publicDb = CKContainer.default().publicCloudDatabase
    
    static func fetch(recordType: RecordType, filter: Filter? = nil, completion: @escaping ([CKRecord]?, Error?) -> Void){
        
        if let filter = filter{
            let query = CKQuery(recordType: recordType.rawValue, predicate: filter.predicate)
            publicDb.perform(query, inZoneWith: nil) { (records, error) in
                completion(records, error)
            }
        }
        else{
            let query = CKQuery(recordType: recordType.rawValue, predicate: NSPredicate(value: true))
            publicDb.perform(query, inZoneWith: nil) { (records, error) in
                completion(records, error)
            }
        }
    }
    
    static func fetchWithId(recordID: CKRecord.ID, completion: @escaping (CKRecord?, Error?) -> Void){
        publicDb.fetch(withRecordID: recordID) { (record, error) in
            completion(record, error)
        }
    }
    
    static private func getCurrentUserID(completion: @escaping (CKRecord.ID?) -> Void){

        CloudKitWrapper.container.fetchUserRecordID { (recordID, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else{
               completion(recordID)
            }
        }
    }
    
    static private func getCurrentSystemUser(completion: @escaping (CKRecord?, Error?) -> Void){
        
        getCurrentUserID { (recordID) in
            if let recordID = recordID{
                publicDb.fetch(withRecordID: recordID, completionHandler: { (record, error) in
                    completion(record, error)
                })
            }
        }
    }
    
    static func getCurrentUser(completion: @escaping (CKRecord?, Error?) -> Void){
        getCurrentSystemUser { (record, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            else if let record = record{
                if let user = record["user"] as? CKRecord.Reference{
                    publicDb.fetch(withRecordID: user.recordID, completionHandler: { (record, error) in
                        completion(record, error)
                    })
                }
            }
        }
    }
    
    static func createCurrentUser(user: User){
        getCurrentSystemUser { (record, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let record = record{
                user.save()
                record.setValue(CKRecord.Reference(record: user.getRecord(), action: .none), forKey: "user")
                publicDb.save(record, completionHandler: { (record, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    else if let record = record{
                        print(record)
                    }
                })
            }
        }
    }
}
