//
//  TeammateCardView.swift
//  Putometro
//
//  Created by Bia Plutarco on 14/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class TeammateCardView: UIView {
    private var image: UIImage
    private var name: String
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
    
    convenience init(name: String, image: UIImage) {
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.init(frame: frame, name: name, image: image)
    }

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
        super.draw(rect)
        configCardView()
        guard let offset = offset else { return }
        configTeammateImageConstraints(offset: offset)
        configTeammateNameConstrains(offset: offset)
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
    
    private func configTeammateImageConstraints(offset: CGFloat) {
        teammateImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: offset).isActive = true
        teammateImage.widthAnchor.constraint(equalToConstant: self.frame.height/1.6).isActive = true
        teammateImage.heightAnchor.constraint(equalTo: teammateImage.widthAnchor).isActive = true
    }
    
    private func configTeammateNameConstrains(offset: CGFloat) {
        teammateName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teammateName.leftAnchor.constraint(equalTo: teammateImage.rightAnchor, constant: offset).isActive = true
        teammateName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -offset).isActive = true
    }
}
