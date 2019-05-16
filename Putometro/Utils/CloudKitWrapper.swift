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

class CloudKitWrapper: NSObject{
    
    static private let container = CKContainer.default()
    static private let publicDb = CKContainer.default().publicCloudDatabase
    
    static func fetch(recordType: RecordType, predicate: NSPredicate, completion: @escaping ([CKRecord]?) -> Void){
        
        let query = CKQuery(recordType: recordType.rawValue, predicate: predicate)
        publicDb.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            else{
                completion(records)
            }
        }
    }
    
    static func save(record: CKRecord, completion: ((CKRecord?) -> Void)? = nil){
        
        publicDb.save(record) { (recordResponse, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            else{
                if let completion = completion{
                    completion(recordResponse)
                }
            }
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
    
    static func getCurrentUser(completion: @escaping (CKRecord?) -> Void){
        
        getCurrentUserID { (recordID) in
            if let recordID = recordID{
                publicDb.fetch(withRecordID: recordID, completionHandler: { (record, error) in
                    if let error = error{
                        print(error.localizedDescription)
                    }
                    else{
                        completion(record)
                    }
                })
            }
        }
    }
    
    static func createUser(name: String, photo: UIImage = UIImage(), rageMeasurer: RageMeasurer = RageMeasurer()){
    
        getCurrentUserID { (recordID) in
            if let recordID = recordID{
                let newUser = CKRecord(recordType: RecordType.user.rawValue, recordID: recordID)
                newUser.setValue(name, forKey: "name")
                save(record: newUser)
            }
        }
    }
}
