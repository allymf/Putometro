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
    
    init(rageLevel: Int, isInChaos: Int, record: CKRecord?) {
        super.init()
        
        if let record = record{
            self.record = record
        }
        else{
            self.record = CKRecord(recordType: RecordType.rageMeasurer.rawValue)
        }
        
        setupRecord(rageLevel: rageLevel, isInChaos: isInChaos)
    }
    
    private func setupRecord(rageLevel: Int, isInChaos: Int){
        self.rageLevel = rageLevel
        self.isInChaos = isInChaos
    }
}
