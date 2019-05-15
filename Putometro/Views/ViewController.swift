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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8822783828, green: 0.8824023604, blue: 0.8822392821, alpha: 1)
        
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        button.heightAnchor.constraint(equalToConstant: view.frame.height/17).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        view.backgroundColor = .blue
    }
}


