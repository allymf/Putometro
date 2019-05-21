//
//  AddCell.swift
//  Putometro
//
//  Created by Thalys Viana on 20/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class AddCell: UITableViewCell {
    lazy var containerView: UIView = {
        let view = UIView()
        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.23
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        return view
    }()
    
    lazy var addImageView: UIImageView = {
        let image = UIImage(named: "plus")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)
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
        containerView.addSubview(label)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupConstraints()
    }
    
    func setupCell(title: String) {
        titleLabel.text = title
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
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -2)
        ])
        // addButton Constraints
        NSLayoutConstraint.activate([
            addImageView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
            addImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 40)
            ])
        // titleLabel Constraints
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: addImageView.trailingAnchor, constant: 70)
            ])
    }

}
