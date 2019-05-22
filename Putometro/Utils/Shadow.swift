//
//  Shadow.swift
//  Putometro
//
//  Created by Bia Plutarco on 15/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

protocol Shadow: class {
}

extension Shadow {
    func configShadow(_ view: UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.23
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowColor = UIColor.black.cgColor
    }
}

