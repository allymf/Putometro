//
//  CircleView.swift
//  Putometro
//
//  Created by Bia Plutarco on 15/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    var isSelected = false
    var color: UIColor
    
    init(frame: CGRect, color: UIColor) {
        self.color = color
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        configCheckView()
    }
}

//Configuration
extension CircleView: Shadow {
    private func configCheckView() {
        if self.isSelected == true {
            self.image = #imageLiteral(resourceName: "redCheck")
            self.tintColor = color
        } else {
            self.image = #imageLiteral(resourceName: "circle")
        }
        configShadow(self, isDark: false)
    }
}
