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
//    Colors
    var enableColor = #colorLiteral(red: 0.1768031418, green: 0.1757590771, blue: 0.1776101589, alpha: 1)
    var enableTextColor = #colorLiteral(red: 0.8822783828, green: 0.8824023604, blue: 0.8822392821, alpha: 1)
    var disabledColor = #colorLiteral(red: 0.7262298465, green: 0.7219144702, blue: 0.7295480371, alpha: 1)
    
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
extension FillButton {
    private func configButton() {
        layer.cornerRadius = 8
        layer.shadowRadius = ShadowHelper.shared.radius
        layer.shadowOpacity = ShadowHelper.shared.opacity
        layer.shadowOffset = ShadowHelper.shared.offset
        layer.shadowColor = ShadowHelper.shared.darkColor
        setTitle(title, for: .normal)
        
        if isEnabled == true {
            layer.borderWidth = 0
            layer.backgroundColor = enableColor.cgColor
            setTitleColor(enableTextColor, for: .normal)
        } else {
            layer.borderColor = disabledColor.cgColor
            layer.borderWidth = 1.5
            setTitleColor(disabledColor, for: .normal)
        }
    }
}


