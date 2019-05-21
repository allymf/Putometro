//
//  RageMeasurerView.swift
//  Putometro
//
//  Created by Alysson Moreira on 20/05/19.
//  Copyright © 2019 Abat. All rights reserved.
//

import UIKit

class RageMeasurerView: UIView {

    lazy var btRage: RageButton = {
        let button = RageButton()
        return button
    }()
    
    lazy var slRage: UISlider = {
        let slider = UISlider()
        slider.thumbTintColor = UIColor.black
        slider.minimumTrackTintColor = UIColor.black
        slider.maximumTrackTintColor = UIColor(displayP3Red: 0.61568627451, green: 0.61568627451, blue: 0.61568627451, alpha: 1.0)
        return slider
    }()
    
    internal let initialColor = UIColor(displayP3Red: 0.98823529411, green: 0.76470588235, blue: 0.54117647058, alpha: 1.0)
    internal let finalColor = UIColor.red
    
    internal var initialTime = Date()
    
    internal var timer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(btRage)
        addSubview(slRage)
        
        self.isUserInteractionEnabled = true
        
        self.slRage.addTarget(self, action: #selector(didChangeSliderValue(_:)), for: .valueChanged)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressRageButton(_:)))
        
        //let tapBegan = UITapGestureRecognizer(target: sel, action: <#T##Selector?#>)
        
        self.btRage.addGestureRecognizer(longPress)
        
        self.enableConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc internal func didLongPressRageButton(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            
            self.initialTime = Date()
            
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                                   target: self,
                                                   selector: #selector(self.updateSlider),
                                                   userInfo: nil,
                                                   repeats: true)
        }
        else if sender.state == .ended {
            
            if let timer = self.timer {
                timer.invalidate()
            }
            updateSlider()
            
        }
    }
    
    @objc internal func didChangeSliderValue(_ sender: UISlider) {
        
        self.btRage.backgroundColor = UIColor.getIntermidiateFrom(self.initialColor, to: self.finalColor, by: CGFloat(sender.value))
        
    }
    
    @objc internal func updateSlider() {
        let currentTime = Date().timeIntervalSince(initialTime)
        
        //let ellapsedTime = currentTime-initialTime
        
        let factor = max(min(currentTime, 2.0), 0.0)/2.0
        
        print("Ellapsed \(currentTime), Factor \(factor)")
        
        self.slRage.setValue(Float(factor), animated: true)
        self.btRage.backgroundColor = UIColor.getIntermidiateFrom(self.initialColor, to: self.finalColor, by: CGFloat(factor))
    }
    
    
    func enableConstraints() {
        btRage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btRage.topAnchor.constraint(equalTo: self.topAnchor),
            btRage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btRage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            btRage.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7)
            ])
        
        slRage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slRage.topAnchor.constraint(greaterThanOrEqualTo: self.btRage.bottomAnchor, constant: 8),
            slRage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            slRage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            slRage.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        
        
        
    }
    

}
