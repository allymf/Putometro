//
//  RageMeasurer.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

struct RageMeasurer {
    
    var rageLevel: Int{
        didSet{
            record.setValue(rageLevel, forKey: "rageLevel")
        }
    }
    var isInChaos: Bool{
        didSet{
            record.setValue(isInChaos, forKey: "isInChaos")
        }
    }
    
    private var record = CKRecord(recordType: RecordType.rageMeasurer.rawValue)
    
    init(rageLevel: Int, isInChaos: Bool) {
        self.rageLevel = rageLevel
        self.isInChaos = isInChaos
    }
    
    func getRecord() -> CKRecord{
        return record
    }
    
    mutating func setRecord(record: CKRecord){
        self.record = record
    }
}
