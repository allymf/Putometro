//
//  ViewController.swift
//  Putometro
//
//  Created by Alysson Moreira on 06/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit
import CloudKit

final class ViewController: UIViewController {

    lazy var addView: AddView = {
        let view = AddView(title: "Add new conflict")
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(addView)
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


