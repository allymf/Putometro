//
//  Shadow.swift
//  Putometro
//
//  Created by Bia Plutarco on 15/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

protocol Shadow {
    func configShadow(_ view: UIView, isDark: Bool)
}

extension Shadow {
    func configShadow(_ view: UIView, isDark: Bool) {
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 1, height: 10)
        view.layer.shadowOpacity = 0.2
        
        if isDark == true {
            view.layer.shadowColor = UIColor.black.cgColor
        } else {
            view.layer.shadowColor = UIColor.lightGray.cgColor
        }
        
    }
}

