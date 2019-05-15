//
//  TeammateCell.swift
//  Putometro
//
//  Created by Bia Plutarco on 14/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class TeammateCell: UITableViewCell {
    lazy var circleView: CircleView = {
        let circle = CircleView(frame: CGRect(origin: self.frame.origin, size: self.frame.size),
                                color: UIColor.AppColors.red)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    lazy var teammateCardView: TeammateCardView = {
        let card = TeammateCardView(frame: CGRect(origin: self.frame.origin, size: self.frame.size),
                                    name: "Beatriz Plutarco",
                                    image: #imageLiteral(resourceName: "houcine-ncib-1579803-unsplash"))
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
}

