//
//  FillButton.swift
//  Putometro
//
//  Created by Bia Plutarco on 14/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class FillButton: UIButton {
    var title: String
    
    init(frame: CGRect, title: String) {
        self.title = title
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configButton()
    }
}

//Configuration
extension FillButton: Shadow {
    private func configButton() {
        layer.cornerRadius = 8
        setTitle(title, for: .normal)
        
        if isEnabled == true {
            configShadow(self, isDark: true)
            layer.borderWidth = 0
            layer.backgroundColor = UIColor.AppColors.darkGray.cgColor
            setTitleColor(UIColor.AppColors.ligthGray, for: .normal)
        } else {
            layer.borderColor = UIColor.AppColors.ligthGray.cgColor
            layer.borderWidth = 1.5
            setTitleColor(UIColor.AppColors.ligthGray, for: .normal)
        }
    }
}


