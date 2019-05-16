//
//  CloudKitWrapper.swift
//  Putometro
//
//  Created by Adauto Pinheiro on 09/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
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

class CloudKitWrapper: NSObject{
    
    static private let container = CKContainer.default()
    static private let publicDb = CKContainer.default().publicCloudDatabase
    
    static func fetch(recordType: RecordType, predicate: NSPredicate, completion: (([CKRecord]) -> Void)? = nil) -> [CKRecord]?{
        let query = CKQuery(recordType: recordType.rawValue, predicate: predicate)
        var recordsArray: [CKRecord]?
        
        publicDb.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error{
                print(error.localizedDescription)
                
            }
            else{
                guard let records = records else { return }
                recordsArray = records
                if let completion = completion{
                    completion(records)
                }
            }
        }
        return recordsArray
    }
    
    static func save(record: CKRecord, completion: ((CKRecord) -> Void)? = nil){
        publicDb.save(record) { (recordResponse, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            guard let recordResponse = recordResponse else { return }
            if let completion = completion{
                completion(recordResponse)
            }
        }
    }
    
    static func getUserIdentity() -> CKUserIdentity?{
        
        var identity: CKUserIdentity?
        container.requestApplicationPermission(CKContainer_Application_Permissions.userDiscoverability) { (_, error) in
            if let error = error{
                print(error.localizedDescription)
            }
        }

        container.fetchUserRecordID { (recordID, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else{
                guard let recordID = recordID else { return }
                container.discoverUserIdentity(withUserRecordID: recordID, completionHandler: { (userIdentity, error2) in
                    if let error2 = error2{
                        print(error2.localizedDescription)
                    }
                    else{
                        if let userIdentity = userIdentity{
                            identity = userIdentity
                        }
                    }
                })
            }
        }
        return identity
    }
}
