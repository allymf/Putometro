//
//  LeaderBoardView.swift
//  Putometro
//
//  Created by Adauto Pinheiro on 21/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class LeaderBoardView: UIView, Shadow {
    
    var pissed = LeaderboardImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    var angel = LeaderboardImageView(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
    var devil = LeaderboardImageView(frame: CGRect(x: 0, y: 0, width: 48, height: 48))

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintPissedView()
        constraintDevilView()
        constraintAngelView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func constraintPissedView(){
        addSubview(pissed)
        pissed.type = .pissed
        pissed.translatesAutoresizingMaskIntoConstraints = false
        pissed.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        pissed.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        pissed.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        pissed.heightAnchor.constraint(equalToConstant: 80).isActive = true
        pissed.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        configShadow(pissed)
    }
    
    private func constraintDevilView(){
        addSubview(devil)
        devil.type = .devil
        devil.translatesAutoresizingMaskIntoConstraints = false
        devil.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        devil.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        devil.heightAnchor.constraint(equalToConstant: 48).isActive = true
        devil.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        configShadow(devil)
    }
    
    private func constraintAngelView(){
        addSubview(angel)
        angel.type = .angel
        angel.translatesAutoresizingMaskIntoConstraints = false
        angel.trailingAnchor.constraint(equalTo: devil.leadingAnchor, constant: -8).isActive = true
        angel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        angel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        angel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        configShadow(angel)
    }
    

}
