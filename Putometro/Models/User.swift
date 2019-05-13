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
    
    var name: String{
        didSet{
            record.setValue(name, forKey: "name")
        }
    }
    var photo: UIImage{
        didSet{
            if let imageData = photo.pngData(){
                if let temporaryUrl = URL(dataRepresentation: imageData, relativeTo: nil){
                    record.setValue(CKAsset(fileURL: temporaryUrl), forKey: "photo")
                }
            }
        }
    }
    var rageMeasurer: RageMeasurer{
        didSet{
            record.setValue(CKRecord.Reference(record: rageMeasurer.getRecord(), action: .deleteSelf), forKey: "rageMeasurer")
        }
    }
    
    private var record = CKRecord(recordType: RecordType.user.rawValue)
    
    init(name: String, photo: UIImage, rageMeasurer: RageMeasurer){
        self.name = name
        self.photo = photo
        self.rageMeasurer = rageMeasurer
    }
    
    func getRecord() -> CKRecord{
        return record
    }
    
    mutating func setRecord(record: CKRecord){
        self.record = record
    }
}
