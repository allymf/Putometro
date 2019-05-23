//
//  FCTableViewModels.swift
//  Putometro
//
//  Created by Adauto Pinheiro on 21/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import UIKit
protocol FCTableViewModelObserver {
    func modelDidUpdate()
}

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
                    let conflict = Conflict(record: record)
                    self.conflicts.append(conflict)
                })
                completion()
            }
        }
    }
}

extension FCTableViewModel: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if conflicts.count > 0{
            return conflicts.count
        }
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if conflicts.count > 0 {
            return conflicts[section].brokenRules.count
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BrokenRuleCell") as? BrokenRuleCell{
            
            if conflicts.count > 0{
                let viewModel = conflicts[indexPath.section].brokenRules[indexPath.row]
                cell.setupCell(ruleTitle: viewModel.title, isBottomLineHidden: false)
            }
            else{
                cell.setupCell(ruleTitle: "Bateu no filho da puta", isBottomLineHidden: false)
                if indexPath.row > 1{
                    cell.bottomLineView.isHidden = true
                }
                else{
                    cell.bottomLineView.isHidden = false
                }
            }
            
            return cell
        }
        return UITableViewCell()
    }
}
