//
//  OneLineSC.swift
//  Putometro
//
//  Created by Bia Plutarco on 13/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class OneLineSC: UIControl {
    private var buttons = [UIButton]()
    private var buttonTitles: [String]
    private var selectorView: UIView?
    private var stackView: UIStackView?
    
    var textColor: UIColor = #colorLiteral(red: 0.4950222373, green: 0.4920834899, blue: 0.4972836971, alpha: 1)
    var selectorViewColor: UIColor = #colorLiteral(red: 0.1768031418, green: 0.1757590771, blue: 0.1776101589, alpha: 1)
    var selectorViewTextColor: UIColor = #colorLiteral(red: 0.1768031418, green: 0.1757590771, blue: 0.1776101589, alpha: 1)
    
    private func configStackView() {
        stackView = UIStackView(arrangedSubviews: buttons)
        
        guard let stackView = stackView else { return }
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
//      Stack Constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private func configSelectorView() {
        let selectorWidth = frame.width/CGFloat(buttonTitles.count*2)
        selectorView = UIView(frame: CGRect(x: selectorWidth/2,
                                            y: self.frame.height,
                                            width: selectorWidth,
                                            height: 1))
        
        guard let selectorView = selectorView else { return }
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)

    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorViewColor, for: .normal)
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, button) in buttons.enumerated() {
            button.setTitleColor(textColor, for: .normal)
            
            if button == sender {
                let offset = frame.width/CGFloat(buttonTitles.count*2)/2
                let selectorPosition = (frame.width/CGFloat(buttonTitles.count)*CGFloat(buttonIndex))+offset
                
                UIView.animate(withDuration: 0.3) {
                    guard let selectorView = self.selectorView else { return }
                    selectorView.frame.origin.x = selectorPosition
                }
                
                button.setTitleColor(selectorViewColor, for: .normal)
            }
        }
    }
    
    private func uptadeView() {
        createButton()
        configStackView()
        configSelectorView()
    }

    init(frame: CGRect, buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        uptadeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
