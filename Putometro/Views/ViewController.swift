//
//  ViewController.swift
//  Putometro
//
//  Created by Alysson Moreira on 06/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableViewTest = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = FillButton(frame: CGRect(x: view.frame.width/2 - view.frame.width/6,
                                              y: view.frame.height/1.2,
                                              width: view.frame.width/3,
                                              height: view.frame.height/17),
                                title: "Done")
        view.backgroundColor = #colorLiteral(red: 0.8822783828, green: 0.8824023604, blue: 0.8822392821, alpha: 1)
        view.addSubview(button)
        button.isEnabled = true
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        tableViewTest = UITableView(frame: CGRect(x: 0,
                                                      y: 0,
                                                      width: view.frame.width,
                                                      height: view.frame.height/1.6))
        tableViewTest.backgroundColor = .blue
        view.addSubview(tableViewTest)
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        view.backgroundColor = .red
    }
}


