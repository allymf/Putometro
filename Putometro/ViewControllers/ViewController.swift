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
        button.setTitle("X", for: .normal)
        return button
    }()
    
    var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Desfalque"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
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
        view.backgroundColor = UIColor.AppColors.gray
        //
        constraintTopButton()
        constraintLabel()
        constraintLeaderBoardView()
        constraintOneLineSC()
        
    }
    
    private func constraintTopButton(){
        view.addSubview(topButton)
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        topButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        topButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        topButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
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
        //          SegmentedControl Constraints
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: leaderBoardView.bottomAnchor, constant: 16).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 35).isActive = true
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
