//
//  Leaderboard.swift
//  Putometro
//
//  Created by Alysson Moreira on 07/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import CloudKit

class Leaderboard: CloudKitModel {
    var angel = User()
    var devil = User()
    
    override init() {
        super.init()
        self.record = CKRecord(recordType: RecordType.leaderboard.rawValue)
    }
}
