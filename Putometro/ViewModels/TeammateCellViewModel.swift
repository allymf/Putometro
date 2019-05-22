//
//  TeammateCellViewModel.swift
//  Putometro
//
//  Created by Bia Plutarco on 22/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

//struct TeammateCellViewModel {
//    <#fields#>
//}

protocol TableControllerViewModelProtocol {
    
    var title: String { get }
    var cellType: [UITableViewCell.Type] { get }
    
    func setupTableView(table: UITableView)
    
}

class DaviTableControllerViewModel: TableControllerViewModelProtocol {
    
    var title: String {
        return "Davi"
    }
    
    var cellType: [UITableViewCell.Type] {
        return [BrokenRuleCell.self, AddCell.self]
    }
    
    func setupTableView(table: UITableView) {
        for type in cellType {
            table.register(type, forCellReuseIdentifier: "asdha")
        }
    }
}

class BiaTableControllerViewModel: TableControllerViewModelProtocol {
    
    var title: String {
        return "Bia"
    }
    
    var cellType: [UITableViewCell.Type] {
        return [TeammateCell.self]
    }
    
    func setupTableView(table: UITableView) {
        for type in cellType {
            table.register(type, forCellReuseIdentifier: "asdha")
        }
    }
}


class MinhaController: UIViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
       return table
    }()
    
    var viewModel: TableControllerViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.setupTableView(table: tableView)
    }
    
    
    convenience init(withViewModel viewModel: TableControllerViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    
    
}
