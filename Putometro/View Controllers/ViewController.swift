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
        let rage = RageMeasurer()
        rage.isInChaos = false
        rage.rageLevel = 650
        rage.save()
        // Do any additional setup after loading the view.
    }
}


