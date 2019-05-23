//
//  ViewController.swift
//  Putometro
//
//  Created by Bia Plutarco on 13/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

// Changed folder structure

import UIKit

class ViewController: UIViewController {
    
    var topButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setImage(#imageLiteral(resourceName: "team"), for: .normal)
        return button
    }()
    
    var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Desfalque"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    var addButton: UIView = {
        let view = AddView(title: "Add new conflict")
        let button = UIButton()
        
        return view
    }()
    
    var tableViewModel = FCTableViewModel()
    
    var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.register(ConflictHeaderView.self, forHeaderFooterViewReuseIdentifier: "ConflictHeaderView")
        table.register(BrokenRuleCell.self, forCellReuseIdentifier: "BrokenRuleCell")
        
        return table
    }()
    
    var leaderBoardView = LeaderBoardView()
    
    lazy var mockItems: [String] = {
        return ["Conflicts", "Rules", "Teammates"]
    }()
    
    lazy var segmentedControl: OneLineSC = {
        let segControl = OneLineSC(frame: CGRect(x: 0, y: 0, width: 0, height: 0), buttonTitles: mockItems)
        segControl.delegate = self
        return segControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.AppColors.ligthGray
        //
        
        tableView.delegate = self
        tableView.dataSource = tableViewModel
        
        topButton.addTarget(self, action: #selector(didTapTopButton(sender:)), for: .touchUpInside)
//        addButton.addTarget(self, action: #selector(didTapAddButton(sender:)), for: .touchUpInside)
        
        constraintTopButton()
        constraintLabel()
        constraintLeaderBoardView()
        constraintOneLineSC()
        constraintAddButton()
        constraintTableView()
        
        tableViewModel.getAllConflicts {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    @objc func didTapTopButton(sender: UIButton){
        print("TopButton")
    }
    @objc func didTapAddButton(sender: UIButton){
        print("AddButton")
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ConflictHeaderView") as? ConflictHeaderView{
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}


extension ViewController: OneLineSGDelegate {
    func didChangeTo(index: Int) {
        switch index {
        case 0:
            break
        case 1:
            break
        default:
            break
        }
    }
}
