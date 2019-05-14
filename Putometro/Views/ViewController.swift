//
//  ViewController.swift
//  Putometro
//
//  Created by Alysson Moreira on 06/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = FillButton(frame: CGRect(x: view.center.x, y: 50,
                                              width: view.frame.width/3,
                                              height: view.frame.height/17),
                                title: "Done")
        view.backgroundColor = #colorLiteral(red: 0.8822783828, green: 0.8824023604, blue: 0.8822392821, alpha: 1)
        view.addSubview(button)
    }
}


