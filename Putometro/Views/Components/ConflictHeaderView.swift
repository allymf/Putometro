//
//  ConflictHeaderView.swift
//  Putometro
//
//  Created by Alysson Moreira on 13/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class ConflictHeaderView: UITableViewHeaderFooterView, Shadow {
    
    lazy var whitePlaneView: UIView = {
        let whiteView = UIView()
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 8
        return whiteView
    }()
    
    lazy var ivAuthor: UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imgView.clipsToBounds = true
        
        imgView.layer.cornerRadius = imgView.frame.width/2
        imgView.backgroundColor = .red
        return imgView
    }()
    
    lazy var lbVersus: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        label.text = "VS"
        return label
    }()
    
    lazy var ivCauser: UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imgView.layer.cornerRadius = imgView.frame.width/2
        
        imgView.clipsToBounds = true
        
        let redLayer = CAShapeLayer()
        redLayer.path = UIBezierPath(ovalIn: imgView.bounds).cgPath
        redLayer.fillColor = UIColor.red.cgColor
        redLayer.opacity = 0.3
        
        imgView.layer.addSublayer(redLayer)
        imgView.backgroundColor = .blue
        return imgView
    }()
    
    lazy var lbPlus: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.textAlignment = .center
        label.text = "+10"
        return label
    }()
    
    
    weak var delegate: ConflictHeaderTapDelegate?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.AppColors.ligthGray
        self.addSubview(whitePlaneView)
        whitePlaneView.addSubview(ivAuthor)
        whitePlaneView.addSubview(ivCauser)
        whitePlaneView.addSubview(lbVersus)
        whitePlaneView.addSubview(lbPlus)
        
        enableConstraints()
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))))
    }
    
    @objc internal func handleTap(_ sender: UITapGestureRecognizer) {
        delegate?.didTapHeader(sender: sender)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func enableConstraints() {
        
        whitePlaneView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whitePlaneView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            whitePlaneView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            whitePlaneView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            whitePlaneView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
            ])
        configShadow(whitePlaneView)
        
        ivAuthor.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ivAuthor.centerYAnchor.constraint(equalTo: whitePlaneView.centerYAnchor, constant: whitePlaneView.frame.height/2),
            ivAuthor.leadingAnchor.constraint(equalTo: whitePlaneView.leadingAnchor, constant: 16),
            ivAuthor.widthAnchor.constraint(equalTo: whitePlaneView.heightAnchor, multiplier: 0.6),
            ivAuthor.heightAnchor.constraint(equalTo: whitePlaneView.heightAnchor, multiplier: 0.6)
            ])
        
        lbVersus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                lbVersus.centerXAnchor.constraint(equalTo: whitePlaneView.centerXAnchor),
                lbVersus.centerYAnchor.constraint(equalTo: whitePlaneView.centerYAnchor, constant: whitePlaneView.frame.height/2)
            ])
        
        ivCauser.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ivCauser.centerYAnchor.constraint(equalTo: whitePlaneView.centerYAnchor, constant: whitePlaneView.frame.height/2),
            ivCauser.trailingAnchor.constraint(equalTo: whitePlaneView.trailingAnchor, constant: -16),
            ivCauser.widthAnchor.constraint(equalTo: whitePlaneView.heightAnchor, multiplier: 0.6),
            ivCauser.heightAnchor.constraint(equalTo: whitePlaneView.heightAnchor, multiplier: 0.6)])
        
        lbPlus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lbPlus.centerXAnchor.constraint(equalTo: ivCauser.centerXAnchor),
            lbPlus.centerYAnchor.constraint(equalTo: ivCauser.centerYAnchor),
            lbPlus.widthAnchor.constraint(equalTo: ivCauser.widthAnchor),
            lbPlus.heightAnchor.constraint(equalTo: ivCauser.heightAnchor)
            ])
        
    }
    

}

protocol ConflictHeaderTapDelegate: ConflictHeaderView {
    func didTapHeader(sender: UITapGestureRecognizer)
}
