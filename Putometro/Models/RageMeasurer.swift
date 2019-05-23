//
//  RageMeasurer.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

class RageMeasurer: CloudKitModel {
    
    var rageLevel = 0{
        didSet{
            record.setValue(rageLevel, forKey: "rageLevel")
        }
    }
    var isInChaos = 0{
        didSet{
            record.setValue(isInChaos, forKey: "isInChaos")
        }
    }
    
    override init() {
        super.init()
        self.record = CKRecord(recordType: RecordType.rageMeasurer.rawValue)
    }
    
    init(record: CKRecord) {
        super.init()
        self.record = record
        
        
        var rageLevelAux = 0
        if let rageLevel = record["rageLevel"] as? Int{
            rageLevelAux = rageLevel
        }
        
        var isInChaosAux = 0
        if let isInChaos = record["isInChaos"] as? Int{
            isInChaosAux = isInChaos
        }
        
        setupRecord(rageLevel: rageLevelAux, isInChaos: isInChaosAux)
    }
    
    init(rageLevel: Int, isInChaos: Int) {
        super.init()
        
        self.record = CKRecord(recordType: RecordType.rageMeasurer.rawValue)
        setupRecord(rageLevel: rageLevel, isInChaos: isInChaos)
    }
    
    private func setupRecord(rageLevel: Int, isInChaos: Int){
        self.rageLevel = rageLevel
        self.isInChaos = isInChaos
    }
}
