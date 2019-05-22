//
//  OneLineSC.swift
//  Putometro
//
//  Created by Bia Plutarco on 13/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class OneLineSC: UIControl {
//    Variables
    private var buttons = [UIButton]()
    private var buttonTitles: [String]
    private var selectorView = UIView()
    private var stackView = UIStackView()
//    Delegate
    weak var delegate: OneLineSGDelegate?
//    StackView
    var stacksWitdh = CGFloat()
//    SelectorView
    var selectedIndex: Int = 0
    var selectorViewWidth = CGFloat()
    var textColor: UIColor = #colorLiteral(red: 0.7262298465, green: 0.7219144702, blue: 0.7295480371, alpha: 1)
    var selectorViewColor: UIColor = #colorLiteral(red: 0.1768031418, green: 0.1757590771, blue: 0.1776101589, alpha: 1)
    var selectorViewTextColor: UIColor = #colorLiteral(red: 0.1768031418, green: 0.1757590771, blue: 0.1776101589, alpha: 1)
    var leftAnchorSelectorView: NSLayoutConstraint?
    
//    Functions
    init(frame: CGRect, buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setIndex(index: selectedIndex)
        uptadeView()
    }
    
//    Set Index of StackView
    func setIndex(index: Int) {
//        Set initial index to 0
        selectedIndex = index
        delegate?.didChangeTo(index: index)
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, button) in buttons.enumerated() {
            button.setTitleColor(.black, for: .normal)
            if button == sender {
                button.setTitleColor(selectorViewColor, for: .normal)
                setIndex(index: buttonIndex)
//                Anchor to animate
                if let left = leftAnchorSelectorView {
                    left.isActive = false
                    selectorView.removeConstraint(left)
                }
                let offset = (stacksWitdh - selectorViewWidth)/2 + stacksWitdh*CGFloat(buttonIndex)
                leftAnchorSelectorView = selectorView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: offset)
                leftAnchorSelectorView?.isActive = true
//               Animate
                UIView.animate(withDuration: 0.3) {
                    self.layoutIfNeeded()
                }
            }
        }
    }
}

//Configuration Views
extension OneLineSC {
    private func uptadeView() {
        createButton()
        configStackView()
        configSelectorView()
    }
    
    private func configStackView() {
//        Setup
        stackView = UIStackView(arrangedSubviews: buttons)
        stacksWitdh = self.frame.width/CGFloat(buttons.count)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
//        Constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    private func configSelectorView() {
//        Setup
        selectorView.backgroundColor = selectorViewColor
        selectorViewWidth = 64
        addSubview(selectorView)
//        Constraints
        selectorView.translatesAutoresizingMaskIntoConstraints = false
        selectorView.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        selectorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        selectorView.widthAnchor.constraint(equalToConstant: selectorViewWidth).isActive = true
//        Anchor to animate
        leftAnchorSelectorView = selectorView.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                                    constant: (stacksWitdh - selectorViewWidth)/2)
        leftAnchorSelectorView?.isActive = true
    }
    
//    Create Buttons to StackView
    private func createButton() {
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            buttons.append(button)
        }
//        Set the first item in button to selected
        buttons[0].setTitleColor(selectorViewColor, for: .normal)
    }
}
