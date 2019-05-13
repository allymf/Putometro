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
    
    override init() {
        self.rageLevel = 0
        self.isInChaos = false
        super.init()
        self.record = CKRecord(recordType: RecordType.rageMeasurer.rawValue)
        
    }
}
