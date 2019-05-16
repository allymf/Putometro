//
//  AddCell.swift
//  Putometro
//
//  Created by Thalys Viana on 14/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class AddView: UIView {
    lazy var addImageView: UIImageView = {
        let image = UIImage(named: "plus")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.layer.shadowOpacity = 0.23
        imageView.layer.masksToBounds = false
        imageView.layer.shadowOpacity = 0.23
        imageView.layer.shadowRadius = 4
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowColor = UIColor.black.cgColor
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String) {
        self.init()
        titleLabel.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    private func setupViews() {
        self.layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        backgroundColor = .white
        layer.cornerRadius = 8
        
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContraints() {
        guard let superview = superview else {
            print("Could not load superview in \(AddView.description())")
            return
        }
        // addView Constraints
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16),
            self.heightAnchor.constraint(equalToConstant: 60)
            ])
        
        // addButton Constraints
        NSLayoutConstraint.activate([
            addImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            addImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        ])
        // titleLabel Constraints
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: addImageView.trailingAnchor, constant: 70)
        ])
    }
}
