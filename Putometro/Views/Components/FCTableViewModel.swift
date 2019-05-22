//
//  FCTableViewModels.swift
//  Putometro
//
//  Created by Adauto Pinheiro on 21/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import UIKit

class FCTableViewModel: NSObject{
    
    var conflicts = [Conflict]()
    
    override init() {
        super.init()
        
    }
    
    func getAllConflicts(completion: @escaping () -> Void){
        CloudKitWrapper.fetch(recordType: .conflict) { (records, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            else if let records = records{
                records.forEach({ (record) in
                    self.conflicts.append(Conflict(record: record))
                })
                completion()
            }
        }
    }
}
