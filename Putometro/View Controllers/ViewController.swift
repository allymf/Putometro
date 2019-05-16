//
//  ViewController.swift
//  Putometro
//
//  Created by Alysson Moreira on 06/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CloudKitWrapper.getCurrentUser { (record, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            if let record = record{
                let user = User(name: "Adauto Pinheiro", photo: #imageLiteral(resourceName: "SearchPlaceholder"), rageMeasurer: RageMeasurer(), record: record)
                user.save()
            }
        }
    }
}


