//
//  TeammateCardView.swift
//  Putometro
//
//  Created by Bia Plutarco on 14/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class TeammateCardView: UIView {
    var name: String
    var image: UIImage
    var cardViewColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    lazy var teammateImage: UIImageView = {
        let image = UIImageView()
        image.image = self.image
        image.layer.cornerRadius = self.frame.height/2.4
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var teammateName: UILabel = {
        let name = UILabel()
        name.text = self.name
        name.textColor = #colorLiteral(red: 0.1768031418, green: 0.1757590771, blue: 0.1776101589, alpha: 1)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    init(frame: CGRect, name: String, image: UIImage) {
        self.name = name
        self.image = image
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        configCardView()
        configTeammateImageConstraints()
        configTeammateNameConstrains()
    }
    
    private func configCardView() {
        self.layer.backgroundColor = cardViewColor.cgColor
        self.layer.cornerRadius = 8
        self.layer.shadowColor = ShadowHelper.shared.lightColor
        self.layer.shadowOpacity = ShadowHelper.shared.opacity
        self.layer.shadowRadius = ShadowHelper.shared.radius
        self.layer.shadowOffset = ShadowHelper.shared.offset
        
        self.addSubview(teammateName)
        self.addSubview(teammateImage)
    }
    
    private func configTeammateImageConstraints() {
        teammateImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        teammateImage.widthAnchor.constraint(equalToConstant: self.frame.height/1.4).isActive = true
        teammateImage.heightAnchor.constraint(equalToConstant: self.frame.height/1.4).isActive = true
    }
    
    private func configTeammateNameConstrains() {
        teammateName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateName.leftAnchor.constraint(equalTo: teammateImage.rightAnchor, constant: 10).isActive = true
        teammateName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10).isActive = true
    }
}
