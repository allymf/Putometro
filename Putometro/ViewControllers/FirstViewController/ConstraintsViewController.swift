//
//  ConstraintsViewController.swift
//  Putometro
//
//  Created by Adauto Pinheiro on 22/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    
    func constraintTopButton(){
        view.addSubview(topButton)
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        topButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        topButton.heightAnchor.constraint(equalToConstant: 21).isActive = true
        topButton.widthAnchor.constraint(equalToConstant: 31).isActive = true
    }
    
    func constraintLabel(){
        view.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        topLabel.topAnchor.constraint(equalTo: topButton.bottomAnchor, constant: 0).isActive = true
    }
    
    func constraintLeaderBoardView(){
        view.addSubview(leaderBoardView)
        leaderBoardView.translatesAutoresizingMaskIntoConstraints = false
        leaderBoardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        leaderBoardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        leaderBoardView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 16).isActive = true
    }
    
    func constraintOneLineSC(){
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: leaderBoardView.bottomAnchor, constant: 16).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func constraintAddButton(){
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func constraintTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        
        tableView.backgroundColor = UIColor.AppColors.ligthGray
    }
}
