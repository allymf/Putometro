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
    var angel = User(){
        didSet{
            angel.save()
            record.setValue(CKRecord.Reference(record: angel.getRecord(), action: .deleteSelf), forKey: "angel")
        }
    }
    
    var devil = User(){
        didSet{
            devil.save()
            record.setValue(CKRecord.Reference(record: devil.getRecord(), action: .deleteSelf), forKey: "devil")
        }
    }
    
    override init() {
        super.init()
        self.record = CKRecord(recordType: RecordType.leaderboard.rawValue)
    }
    
    init(angel: User, devil: User, record: CKRecord?) {
        super.init()
        if let record = record{
            self.record = record
        }
        else{
            self.record = CKRecord(recordType: RecordType.leaderboard.rawValue)
        }
        setupRecord(angel: angel, devil: devil)
    }
    func setupRecord(angel: User, devil: User){
        self.angel = angel
        self.devil = devil
    }
}
