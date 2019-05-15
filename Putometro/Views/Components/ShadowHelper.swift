//
//  ShadowHelper.swift
//  Putometro
//
//  Created by Bia Plutarco on 15/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

struct ShadowHelper {
    static let shared = ShadowHelper()
    
    let radius: CGFloat = 8
    let offset = CGSize(width: 1, height: 10)
    let lightColor: CGColor = #colorLiteral(red: 0.7262298465, green: 0.7219144702, blue: 0.7295480371, alpha: 1)
    let darkColor: CGColor = #colorLiteral(red: 0.09136682004, green: 0.09179744869, blue: 0.09282245487, alpha: 1)
    let opacity: Float = 0.2
}
