//
//  ChooseTeammateViewController.swift
//  Putometro
//
//  Created by Bia Plutarco on 22/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class ChooseTeammateViewController: UIViewController {
    lazy var tableView: UITableView = {
        return UITableView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.AppColors.ligthGray
        
        tableView.register(TeammateCell.self, forCellReuseIdentifier: "teammateCell")
    }
}

extension ChooseTeammateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
    }
    
    
}
