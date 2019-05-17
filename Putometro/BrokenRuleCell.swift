//
//  BrokenRuleCell.swift
//  Putometro
//
//  Created by Thalys Viana on 16/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class BrokenRuleCell: UITableViewCell {
    lazy var checkView: UIImageView = {
        let image = UIImage(named: "red_check")
        let imageView = UIImageView(image: image)
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowOpacity = 0.23
        imageView.layer.masksToBounds = false
        imageView.layer.shadowOpacity = 0.23
        imageView.layer.shadowRadius = 4
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowColor = UIColor.black.cgColor
        return imageView
    }()
    
    lazy var ruleLabel: UILabel = {
        let label = UILabel()
        addSubview(label)
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var topLineView: UIView = {
        let view = UIView()
        addSubview(view)
        view.backgroundColor = UIColor(displayP3Red: 244/255, green: 175/255, blue: 169/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bottomLineView: UIView = {
        let view = UIView()
        addSubview(view)
        view.backgroundColor = UIColor(red: 244/255, green: 175/255, blue: 169/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var checkImageSize: CGFloat = 25
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupConstraints()
    }
    
    func setupCell(ruleTitle: String, isBottomLineHidden: Bool) {
        if isBottomLineHidden {
            bottomLineView.isHidden = true
        }
        
        ruleLabel.text = ruleTitle
    }
    
    private func setupConstraints() {
        // checkView Constraints
        NSLayoutConstraint.activate([
            checkView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            checkView.heightAnchor.constraint(equalToConstant: checkImageSize),
            checkView.widthAnchor.constraint(equalToConstant: checkImageSize),
            checkView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        // topLineView Constraints
        NSLayoutConstraint.activate([
            topLineView.centerXAnchor.constraint(equalTo: checkView.centerXAnchor),
            topLineView.topAnchor.constraint(equalTo: topAnchor),
            topLineView.widthAnchor.constraint(equalToConstant: 1),
            topLineView.bottomAnchor.constraint(equalTo: checkView.topAnchor)
        ])
        // bottomLineView Constraints
        NSLayoutConstraint.activate([
            bottomLineView.centerXAnchor.constraint(equalTo: checkView.centerXAnchor),
            bottomLineView.topAnchor.constraint(equalTo: checkView.bottomAnchor),
            bottomLineView.widthAnchor.constraint(equalTo: topLineView.widthAnchor),
            bottomLineView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        // ruleDescription Constraints
        NSLayoutConstraint.activate([
            ruleLabel.leadingAnchor.constraint(equalTo: checkView.trailingAnchor, constant: 70),
            ruleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            ruleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
