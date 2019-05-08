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
    var rageLevel: Int
    var isInChaos: Bool
    
    private var record: CKRecord?
    
    init(rageMeasurer: CKRecord) {
        record = rageMeasurer
    }
    
    init(rageLevel: Int, isInChaos: Bool) {
        self.rageLevel = rageLevel
        self.isInChaos = isInChaos
    }
    
    func getRecord() -> CKRecord{
        guard let record = record else {
            let values = ["rageLevel" : rageLevel,
                          "isInChaos" : isInChaos] as [String : Any]
            let rageRecord = CKRecord(recordType: "RageMeasurer")
            rageRecord.setValuesForKeys(values)
            return rageRecord
        }
        return record
    }
}
