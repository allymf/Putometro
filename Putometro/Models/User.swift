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
    var name: String
    var photo: UIImage
    var rageMeasurer: RageMeasurer
    
    private var record: CKRecord?
    
    init(user: CKRecord) {
        <#statements#>
    }
    
    func getRecord() -> CKRecord{
        
    }
}
