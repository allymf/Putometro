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
    
    init(rageLevel: Int, isInChaos: Bool) {
        self.rageLevel = rageLevel
        self.isInChaos = isInChaos
        super.init()
        self.record = CKRecord(recordType: RecordType.rageMeasurer.rawValue)
    }
}
