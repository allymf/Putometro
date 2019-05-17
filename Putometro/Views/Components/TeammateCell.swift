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
    var circleWidthAnchor: NSLayoutConstraint?
    var circleHeigthAnchor: NSLayoutConstraint?
    var circleLeftAnchor: NSLayoutConstraint?
    
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
        
        configCircleViewConstraints(circleView, offset: offset)
        configTeammateCardViewConstraints(teammateCardView, circleView, offset: offset)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        guard let circleView = circleView else { return }
        if selected == true {
            animateConstraintsFrom(circleView: circleView)
            circleView.update(isSelected: true)
        } else {
            circleView.update(isSelected: false)
        }
    }
}

//Configuration + Constraints
extension TeammateCell {
    private func configCircleViewConstraints(_ circleView: CircleView, offset: CGFloat) {
        self.addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        circleLeftAnchor = circleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: offset*2)
        circleLeftAnchor?.isActive = true
        circleHeigthAnchor = circleView.heightAnchor.constraint(equalToConstant: self.frame.height/6)
        circleHeigthAnchor?.isActive = true
        circleWidthAnchor = circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor)
        circleWidthAnchor?.isActive = true
    }
    
    private func animateConstraintsFrom(circleView: CircleView) {
        guard let heightAnchor = circleHeigthAnchor else { return }
        guard let widthAnchor = circleWidthAnchor else { return }
        guard let leftAnchor = circleLeftAnchor else { return }
        guard let offset = offset else { return }
        
        circleView.removeConstraints([heightAnchor, widthAnchor, leftAnchor])
        
        circleLeftAnchor = circleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: offset)
        leftAnchor.isActive = true
        circleHeigthAnchor = circleView.heightAnchor.constraint(equalToConstant: self.frame.height/4)
        heightAnchor.isActive = true
        circleWidthAnchor = circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor)
        widthAnchor.isActive = true
            
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        
    }
    
    private func configTeammateCardViewConstraints(_ teammateCardView: TeammateCardView, _ circleView: CircleView, offset: CGFloat) {
        self.addSubview(teammateCardView)
        teammateCardView.translatesAutoresizingMaskIntoConstraints = false
        teammateCardView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateCardView.leftAnchor.constraint(equalTo: circleView.rightAnchor, constant: offset).isActive = true
        teammateCardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -offset*2).isActive = true
        teammateCardView.heightAnchor.constraint(equalToConstant: self.frame.height/1.2).isActive = true
    }
}
