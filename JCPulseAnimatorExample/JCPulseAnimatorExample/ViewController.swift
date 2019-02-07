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
    
    var pulseView: JCPulseView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pulseView = JCPulseView(withWaveType: JCWaveType.Cos, degrees: JCWaveDegrees.positive360, strokeColor: .green, fillColor: nil, lineWidth: 3.0)
        
        pulseView?.changePulseFrequency(withValue: 30)
        
        self.view.addSubview(pulseView!)
        
        NSLayoutConstraint(item: pulseView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 150).isActive = true
        NSLayoutConstraint(item: pulseView!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: pulseView!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: pulseView!, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let pulseView = self.pulseView else { return }
        pulseView.changeStrokeColorAnimated(fromValue: UIColor.green, toValue: UIColor.red, duration: 1.0, autoreverse: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let pulseView = self.pulseView {
            pulseView.stopAnimation()
        }
        
    }


}

