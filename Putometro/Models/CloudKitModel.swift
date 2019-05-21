//
//  CloudKitModel.swift
//  Putometro
//
//  Created by Adauto Pinheiro on 13/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitModel: NSObject{
    
    private let defaultContainer = CKContainer.default()
    private let publicDb = CKContainer.default().publicCloudDatabase
    internal var record = CKRecord(recordType: "Placeholder")
    
    func getRecord() -> CKRecord{
        return record
    }
    
    func setRecord(record: CKRecord){
        self.record = record
    }
    
    func save(completion: ((CKRecord?, Error?) -> Void)? = nil){
        publicDb.save(record) { (record, error) in
            if let completion = completion {
                completion(record, error)
            }
        }
    }
}
