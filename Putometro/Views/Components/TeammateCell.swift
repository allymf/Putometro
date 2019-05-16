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
    
    var circleView: CircleView?
    var teammateCardView: TeammateCardView?
    
    func setupCell(color: UIColor, name: String, photo: UIImage) {
        self.backgroundColor = .clear
        self.color = color
        self.name = name
        self.photo = photo
        
        circleView = CircleView(frame: CGRect(origin: self.frame.origin, size: self.frame.size),
                                color: color)
        teammateCardView = TeammateCardView(frame: CGRect(origin: self.frame.origin, size: self.frame.size),
                                            name: name,
                                            image: photo)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configCircleView()
        configTeammateCardView()
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
    private func configCircleView() {
        guard let circleView = circleView else { return }
        self.addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        circleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: self.frame.height/6).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: self.frame.height/6).isActive = true
    }
    
    private func configTeammateCardView() {
        guard let teammateCardView = teammateCardView else { return }
        guard let circleView = circleView else { return }
        teammateCardView.layer.backgroundColor = UIColor.AppColors.darkGray.cgColor
        self.addSubview(teammateCardView)
        teammateCardView.translatesAutoresizingMaskIntoConstraints = false
        teammateCardView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateCardView.leftAnchor.constraint(equalTo: circleView.rightAnchor, constant: 20).isActive = true
        teammateCardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        teammateCardView.heightAnchor.constraint(equalToConstant: self.frame.height/1.2).isActive = true
    }
}
