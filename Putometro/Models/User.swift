//
//  User.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

struct User {
    var name: String
    var photo: UIImage
    var rageMeasurer: RageMeasurer
    
    private var record: CKRecord?
    
    init(name: String, photo: UIImage, rageMeasurer: RageMeasurer){
        self.name = name
        self.photo = photo
        self.rageMeasurer = rageMeasurer
    }
    
    func getRecord() -> CKRecord{
        guard let record = record else {
            let newRecord = CKRecord(recordType: "User")
            if let imageData = photo.pngData(){
                if let temporaryUrl = URL(dataRepresentation: imageData, relativeTo: nil){
                    let values = [
                        "name" : name,
                        "photo" : CKAsset(fileURL: temporaryUrl),
                        "rageMeasurer" : CKRecord.Reference(record: rageMeasurer.getRecord(), action: .deleteSelf)
                        ] as [String : Any]
                    newRecord.setValuesForKeys(values)
                }
            }
            return newRecord
        }
        return record
    }
    
    mutating func setRecord(record: CKRecord){
        self.record = record
    }
}
