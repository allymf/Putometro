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
    case user = "Users"
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
    
    static func fetch(recordType: RecordType, filter: Filter, completion: @escaping ([CKRecord]?, Error?) -> Void){
        
        let query = CKQuery(recordType: recordType.rawValue, predicate: filter.predicate)
        publicDb.perform(query, inZoneWith: nil) { (records, error) in
            completion(records, error)
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
    
    static func getCurrentUser(completion: @escaping (CKRecord?, Error?) -> Void){
        
        getCurrentUserID { (recordID) in
            if let recordID = recordID{
                publicDb.fetch(withRecordID: recordID, completionHandler: { (record, error) in
                    completion(record, error)
                })
            }
        }
    }
}
