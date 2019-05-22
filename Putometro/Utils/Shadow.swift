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
    func configShadow(_ view: UIView, isDark: Bool) {
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 1
        
        if isDark{
            view.layer.shadowColor = UIColor.black.cgColor
        } else {
            view.layer.shadowColor = UIColor.lightGray.cgColor
        }
        
    }
}

