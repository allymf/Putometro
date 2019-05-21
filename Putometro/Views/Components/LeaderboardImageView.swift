//
//  LeaderboardView.swift
//  Putometro
//
//  Created by Alysson Moreira on 19/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

enum LeaderboardStatus {
    case pissed
    case devil
    case angel
    
    var color: CGColor {
        switch self {
        case .pissed:
            return UIColor(displayP3Red: 0.98823529411, green: 0.76470588235, blue: 0.54117647058, alpha: 1.0).cgColor
            
        case .devil:
            return UIColor.red.cgColor
            
        case .angel:
            return UIColor(displayP3Red: 0.60784313725, green: 0.81568627451, blue: 0.94117647058, alpha: 1.0).cgColor
        }
    }
    
}

class LeaderboardImageView: UIImageView {
    
    var type: LeaderboardStatus = .pissed {
        didSet {
            self.overlay.fillColor = self.type.color
        }
    }
    
    internal lazy var overlay: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(ovalIn: self.bounds).cgPath
        layer.fillColor = self.type.color
        layer.opacity = 0.3
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.width/2
        
        self.layer.addSublayer(self.overlay)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
