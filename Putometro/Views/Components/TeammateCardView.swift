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
    var offset: CGFloat?
    
    lazy var teammateImage: UIImageView = {
        let image = UIImageView()
        image.image = self.image
        image.layer.cornerRadius = (self.frame.height/1.6)/2
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
        offset = self.frame.height/5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        configCardView()
        configTeammateImageConstraints()
        configTeammateNameConstrains()
    }
    
}

//Configuration + Constraints
extension TeammateCardView: Shadow {
    private func configCardView() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 8
        self.addSubview(teammateName)
        self.addSubview(teammateImage)
        configShadow(self, isDark: false)
    }
    
    private func configTeammateImageConstraints() {
        guard let offset = offset else { return }
        teammateImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateImage.leftAnchor.constraint(equalTo: self.leftAnchor,
                                            constant: offset).isActive = true
        teammateImage.widthAnchor.constraint(equalToConstant: self.frame.height/1.6).isActive = true
        teammateImage.heightAnchor.constraint(equalToConstant: self.frame.height/1.6).isActive = true
    }
    
    private func configTeammateNameConstrains() {
        guard let offset = offset else { return }
        teammateName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateName.leftAnchor.constraint(equalTo: teammateImage.rightAnchor, constant: offset).isActive = true
        teammateName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -offset).isActive = true
    }
}
