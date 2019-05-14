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
        let user = User(name: "Alysson", photo: #imageLiteral(resourceName: "SearchPlaceholder"), rageMeasurer: RageMeasurer(rageLevel: 100, isInChaos: false))
        user.save()
        // Do any additional setup after loading the view.
    }
}


