//
//  RageButton.swift
//  Putometro
//
//  Created by Alysson Moreira on 20/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class RageButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.width/2
        
        self.backgroundColor = UIColor(displayP3Red: 0.98823529411, green: 0.76470588235, blue: 0.54117647058, alpha: 1.0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
