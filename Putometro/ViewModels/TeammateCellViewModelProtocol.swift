//
//  TeammateCellViewModelProtocol.swift
//  Putometro
//
//  Created by Bia Plutarco on 22/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

protocol TeammateCellViewModelProtocol {
    var image: UIImage { get }
    var name: String { get }
    var color: UIColor { get }
    
    func setupCell(_ cell: TeammateCell)
}
