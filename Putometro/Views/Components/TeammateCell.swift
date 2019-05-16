//
//  TeammateCell.swift
//  Putometro
//
//  Created by Bia Plutarco on 14/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class TeammateCell: UITableViewCell {
    var color: UIColor?
    var name: String?
    var photo: UIImage?
    var offset: CGFloat?
    var circleView: CircleView?
    var teammateCardView: TeammateCardView?
    
    func setupCell(color: UIColor, name: String, photo: UIImage) {
        self.backgroundColor = .clear
        self.color = color
        self.name = name
        self.photo = photo
        offset = self.frame.height/5
        circleView = CircleView(frame: CGRect(origin: self.frame.origin, size: self.frame.size), color: color)
        teammateCardView = TeammateCardView(frame: CGRect(origin: self.frame.origin, size: self.frame.size),
                                            name: name,
                                            image: photo)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let circleView = circleView else { return }
        guard let teammateCardView = teammateCardView else { return }
        guard let offset = offset else { return }
        self.addSubview(circleView)
        self.addSubview(teammateCardView)
        configCircleViewConstraints(circleView, offset: offset)
        configTeammateCardViewConstraints(teammateCardView, circleView, offset: offset)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        guard let circleView = circleView else { return }
        if selected == true {
            circleView.update(isSelected: true)
        } else {
            circleView.update(isSelected: false)
        }
    }
}

//Configuration + Constraints
extension TeammateCell {
    private func configCircleViewConstraints(_ circleView: CircleView, offset: CGFloat) {
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        circleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: offset*2).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: self.frame.height/6).isActive = true
        circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor).isActive = true
    }
    
    private func configTeammateCardViewConstraints(_ teammateCardView: TeammateCardView, _ circleView: CircleView, offset: CGFloat) {
        teammateCardView.translatesAutoresizingMaskIntoConstraints = false
        teammateCardView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateCardView.leftAnchor.constraint(equalTo: circleView.rightAnchor, constant: offset).isActive = true
        teammateCardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -offset*2).isActive = true
        teammateCardView.heightAnchor.constraint(equalToConstant: self.frame.height/1.2).isActive = true
    }
}
