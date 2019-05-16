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
        
        configCheckView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//Configuration
extension CircleView: Shadow {
    func configCheckView() {
        if self.isSelected == true {
            self.image = #imageLiteral(resourceName: "checkCircle")
            self.tintColor = color
        } else {
            self.image = #imageLiteral(resourceName: "circle")
            self.tintColor = UIColor.AppColors.darkGray
        }
    }
}
