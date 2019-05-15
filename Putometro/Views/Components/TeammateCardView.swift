//
//  TeammateCardView.swift
//  Putometro
//
//  Created by Bia Plutarco on 14/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class TeammateCardView: UIView, Shadow {
    var name: String
    var image: UIImage
    
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
        name.textColor = UIColor.AppColors.darkGray
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
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 8
        configShadow(self, isDark: false)
        
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
