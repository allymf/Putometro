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
    
    var addView: AddView = {
        let view = AddView(title: "Add new conflict")
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
        tableView.dataSource = self
        
        constraintTopButton()
        constraintLabel()
        constraintLeaderBoardView()
        constraintOneLineSC()
        constraintAddView()
        constraintTableView()
        
        tableViewModel.getAllConflicts {
            self.tableView.reloadData()
        }
        
    }
    
    private func constraintTopButton(){
        view.addSubview(topButton)
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        topButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        topButton.heightAnchor.constraint(equalToConstant: 21).isActive = true
        topButton.widthAnchor.constraint(equalToConstant: 31).isActive = true
    }
    
    private func constraintLabel(){
        view.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        topLabel.topAnchor.constraint(equalTo: topButton.bottomAnchor, constant: 0).isActive = true
    }
    
    private func constraintLeaderBoardView(){
        view.addSubview(leaderBoardView)
        leaderBoardView.translatesAutoresizingMaskIntoConstraints = false
        leaderBoardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        leaderBoardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        leaderBoardView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 16).isActive = true
    }
    
    private func constraintOneLineSC(){
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: leaderBoardView.bottomAnchor, constant: 16).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    private func constraintAddView(){
        view.addSubview(addView)
        addView.translatesAutoresizingMaskIntoConstraints = false
        addView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16).isActive = true
        addView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        addView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        addView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    private func constraintTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: addView.bottomAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        
        tableView.backgroundColor = UIColor.AppColors.ligthGray
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ConflictHeaderView") as? ConflictHeaderView{
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BrokenRuleCell") as? BrokenRuleCell{
            cell.setupCell(ruleTitle: "Bateu no filho da puta", isBottomLineHidden: false)
            return cell
        }
        return UITableViewCell()
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
