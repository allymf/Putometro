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

class User: CloudKitModel {
    
    var name = String(){
        didSet{
            record.setValue(name, forKey: "name")
        }
    }
    
    var photo = UIImage(){
        didSet{
            if let temporaryUrl = photo.createTemporaryUrl(image: photo){
                record.setValue(CKAsset(fileURL: temporaryUrl), forKey: "photo")
            }
        }
    }
    
    var rageMeasurer = RageMeasurer(){
        didSet{
            rageMeasurer.save()
            record.setValue(CKRecord.Reference(record: rageMeasurer.getRecord(), action: .none), forKey: "rageMeasurer")
        }
    }
    
    override init(){
        super.init()
        self.record = CKRecord(recordType: RecordType.user.rawValue)
    }
    
    init(record: CKRecord) {
        super.init()
        self.record = record
        
        
        if let name = record["name"] as? String{
            self.name = name
        }
        
        if let photoAsset = record["photo"] as? CKAsset{
            if let url = photoAsset.fileURL{
                do{
                    let data = try Data(contentsOf: url)
                    if let image = UIImage(data: data){
                        self.photo = image
                    }
                }
                catch{
                    //
                }
            }
        }
        
        if let rageMeasurerReference = record["rageMeasurer"] as? CKRecord.Reference{
            CloudKitWrapper.fetchWithId(recordID: rageMeasurerReference.recordID) { (record, error) in
                if let record = record{
                    self.rageMeasurer = RageMeasurer(record: record)
                }
            }
        }
    }
    
    init(name: String, photo: UIImage, rageMeasurer: RageMeasurer) {
        super.init()

        self.record = CKRecord(recordType: RecordType.user.rawValue)
        setupRecord(name: name, photo: photo, rageMeasurer: rageMeasurer)
    }
    
    
    
    private func setupRecord(name: String, photo: UIImage, rageMeasurer: RageMeasurer){
        self.name = name
        self.photo = photo
        self.rageMeasurer = rageMeasurer
    }
}
