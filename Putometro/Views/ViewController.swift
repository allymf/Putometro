//
//  ViewController.swift
//  Putometro
//
//  Created by Alysson Moreira on 06/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var button: FillButton = {
        let btn = FillButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "Done")
        btn.isEnabled = true
        btn.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = #colorLiteral(red: 0.9544002414, green: 0.9487265944, blue: 0.958761394, alpha: 1)
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9544002414, green: 0.9487265944, blue: 0.958761394, alpha: 1)
        view.addSubview(button)
        view.addSubview(tableView)
//        Constraints
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        button.heightAnchor.constraint(equalToConstant: view.frame.height/17).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20).isActive = true
        
        let card = TeammateCardView(frame: CGRect(x: 100, y: 100, width: 200, height: 50), name: "beatriz plutarco", image: #imageLiteral(resourceName: "houcine-ncib-1579803-unsplash"))
        view.addSubview(card)
        view.bringSubviewToFront(card)
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        view.backgroundColor = .red
    }
}


