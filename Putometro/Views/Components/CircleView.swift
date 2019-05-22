//
//  CircleView.swift
//  Putometro
//
//  Created by Bia Plutarco on 15/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    var color: UIColor
    
    convenience init(color: UIColor) {
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.init(frame: frame, color: color)
    }
    
    init(frame: CGRect, color: UIColor) {
        self.color = color
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configCheckView()
    }
    
}

//Configuration
extension CircleView: Shadow {
    private func configCheckView() {
        self.image = #imageLiteral(resourceName: "checkCircle")
        self.tintColor = color
    }
    
    func update(isSelected: Bool) {
        if isSelected == true {
            self.image = #imageLiteral(resourceName: " check")
            self.tintColor = color
        } else {
            self.image = #imageLiteral(resourceName: "circle")
            self.tintColor = UIColor.AppColors.gray
        }
    }
}
