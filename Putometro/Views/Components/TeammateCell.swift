//
//  TeammateCell.swift
//  Putometro
//
//  Created by Bia Plutarco on 14/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class TeammateCell: UITableViewCell {
    private var circleView: CircleView?
    private var teammateCardView: TeammateCardView?
    private var circleHeigthAnchor: NSLayoutConstraint?
    var alreadySelected = false
    
    func setupCell(color: UIColor, name: String, photo: UIImage) {
        self.backgroundColor = .clear
        circleView = CircleView(color: color)
        teammateCardView = TeammateCardView(name: name, image: photo)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let circleView = circleView else { return }
        guard let teammateCardView = teammateCardView else { return }
        
        configCircleViewConstraints(circleView)
        configTeammateCardViewConstraints(teammateCardView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        guard let circleView = circleView else { return }
        if selected == true {
//            when the user click on a cell already selected
            if alreadySelected == true {
                circleView.update(isSelected: true)
            } else {
                animateConstraintsFrom(circleView: circleView, didSelected: true)
                circleView.update(isSelected: true)
            }
        } else {
            alreadySelected = false
            animateConstraintsFrom(circleView: circleView, didSelected: false)
            circleView.update(isSelected: false)
        }
    }
}

//Configuration + Constraints
extension TeammateCell {
    private func configCircleViewConstraints(_ circleView: CircleView) {
        self.addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        circleView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -self.frame.width/2.6).isActive = true
        
        circleHeigthAnchor = circleView.heightAnchor.constraint(equalToConstant: self.frame.height/6)
        circleHeigthAnchor?.isActive = true
        circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor).isActive = true
    }
    
    private func animateConstraintsFrom(circleView: CircleView, didSelected: Bool) {
        guard let heightAnchor = circleHeigthAnchor else { return }
        heightAnchor.isActive = false
        circleView.removeConstraint(heightAnchor)
        
        if didSelected == false {
            circleHeigthAnchor = circleView.heightAnchor.constraint(equalToConstant: self.frame.height/6)
            circleHeigthAnchor?.isActive = true
            
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
            
        } else {
            alreadySelected = true
            circleHeigthAnchor = circleView.heightAnchor.constraint(equalToConstant: circleView.frame.height*1.6)
            circleHeigthAnchor?.isActive = true
            
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }
    }
    
    private func configTeammateCardViewConstraints(_ teammateCardView: TeammateCardView) {
        self.addSubview(teammateCardView)
        teammateCardView.translatesAutoresizingMaskIntoConstraints = false
        teammateCardView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateCardView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: teammateCardView.frame.width/24).isActive = true
        teammateCardView.heightAnchor.constraint(equalToConstant: self.frame.height/1.2).isActive = true
        teammateCardView.widthAnchor.constraint(equalToConstant: self.frame.width/1.4).isActive = true
    }
}
