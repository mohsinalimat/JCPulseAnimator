//
//  ViewController.swift
//  JCPulseAnimatorExample
//
//  Created by Juan Curti on 31/01/2019.
//  Copyright © 2019 Juan Curti. All rights reserved.
//

import UIKit
import JCPulseAnimator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pulseView = JCPulseView(withWaveType: JCWaveType.ArcSin, degrees: JCWaveDegrees.positive360, strokeColor: .black, fillColor: nil, lineWidth: 3.0)
        
        self.view.addSubview(pulseView)
        
        NSLayoutConstraint(item: pulseView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 150).isActive = true
        NSLayoutConstraint(item: pulseView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: pulseView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: pulseView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        
    }


}

