//
//  UIColor+Interpolate.swift
//  Putometro
//
//  Created by Alysson Moreira on 20/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func getIntermidiateFrom(_ initialColor: UIColor, to finalColor: UIColor, by factor: CGFloat) -> UIColor {
        
        guard let initialCP = initialColor.cgColor.components else { fatalError("Unexpected nil color") }
        guard let finalCP = finalColor.cgColor.components else { fatalError("Unexpected nil color") }
        
        let newRed = CGFloat(initialCP[0] + (finalCP[0] - initialCP[0]) * factor)
        let newGreen = CGFloat(initialCP[1] + (finalCP[1] - initialCP[1]) * factor)
        let newBlue  = CGFloat(initialCP[2] + (finalCP[2] - initialCP[2]) * factor)
        
        return UIColor(displayP3Red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
}
