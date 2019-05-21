//
//  ViewController.swift
//  Putometro
//
//  Created by Bia Plutarco on 13/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

// Changed folder structure

import UIKit

class ViewController: UIViewController {
    var viewzinha = UIView()
    
    lazy var mockItems: [String] = {
        return ["Conflicts", "Rules", "Teammates"]
    }()
    
    lazy var segmentedControl: OneLineSC = {
        let segControl = OneLineSC(frame: CGRect(x: 0, y: 0, width: 0, height: 0), buttonTitles: mockItems)
        segControl.delegate = self
        return segControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8822783828, green: 0.8824023604, blue: 0.8822392821, alpha: 1)
//        SegmentedControl
        view.addSubview(segmentedControl)
//          SegmentedControl Constraints
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: view.frame.width/1.2).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 35).isActive = true
//        View de Teste
        view.addSubview(viewzinha)
//          View de Teste Constraints
        viewzinha.translatesAutoresizingMaskIntoConstraints = false
        viewzinha.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewzinha.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        viewzinha.widthAnchor.constraint(equalToConstant: view.frame.width/1.5).isActive = true
        viewzinha.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
}

extension ViewController: OneLineSGDelegate {
    func changeTo(index: Int) {
        switch index {
        case 0:
            viewzinha.backgroundColor = .red
        case 1:
            viewzinha.backgroundColor = .blue
        default:
            viewzinha.backgroundColor = .green
        }
    }
}
