//
//  ViewController.swift
//  Putometro
//
//  Created by Alysson Moreira on 06/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tv)
        return tv
    }()
    
    let count = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(BrokenRuleCell.self, forCellReuseIdentifier: "BrokenRuleCell")
        
        setupConstraints()
    }
}

// MARK:- Constraints
extension ViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BrokenRuleCell", for: indexPath) as? BrokenRuleCell else {
            print("Could not cast cell to \(BrokenRuleCell.description())")
            return UITableViewCell()
        }
        let lineIsHidden = indexPath.row == (count - 1) ? true : false
        cell.setupCell(ruleTitle: "Bit the teammate", isBottomLineHidden: lineIsHidden)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
}


