//
//  TeammateCell.swift
//  Putometro
//
//  Created by Bia Plutarco on 14/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class TeammateCell: UITableViewCell {
    var color: UIColor
    var name: String
    var photo: UIImage
    
    lazy var circleView: CircleView = {
        let circle = CircleView(frame: CGRect(origin: self.frame.origin, size: self.frame.size),
                                color: self.color)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    lazy var teammateCardView: TeammateCardView = {
        let card = TeammateCardView(frame: CGRect(origin: self.frame.origin, size: self.frame.size),
                                    name: self.name,
                                    image: self.photo)
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, color: UIColor, name: String, photo: UIImage) {
        self.color = color
        self.name = name
        self.photo = photo
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        configCircleViewConstraints()
        configTeammateCardViewConstraints()
    }
}

//Configuration + Constraints
extension TeammateCell {
    private func configCircleViewConstraints() {
        circleView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        circleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: self.frame.height/4).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: self.frame.height/4).isActive = true
    }
    
    private func configTeammateCardViewConstraints() {
        teammateCardView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateCardView.leftAnchor.constraint(equalTo: circleView.rightAnchor, constant: 20).isActive = true
        teammateCardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20).isActive = true
    }
}
