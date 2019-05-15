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
    
    lazy var tableViewTest: UITableView = {
        let table = UITableView()
        table.backgroundColor = .gray
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8822783828, green: 0.8824023604, blue: 0.8822392821, alpha: 1)
        view.addSubview(button)
        view.addSubview(tableViewTest)
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        view.backgroundColor = .red
    }
}


