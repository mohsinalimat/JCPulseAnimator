//
//  JCPulseShapeLayer.swift
//  JCPulseAnimator
//
//  Created by Juan Curti on 31/01/2019.
//  Copyright © 2019 Juan Curti. All rights reserved.
//

import Foundation
import UIKit

public class JCPulseShapeLayer: CAShapeLayer {
    private let strokingColor: UIColor
    private let fillingColor: UIColor
    private let customLineWidth: CGFloat
    
    init(withStrokeColor strokeColor: UIColor = UIColor.black, fillColor: UIColor = UIColor.clear, lineWidth: CGFloat = 3.0) {
        self.strokingColor = strokeColor
        self.fillingColor = fillColor
        self.customLineWidth = lineWidth
        
        super.init()
        
        self.strokeColor = self.strokingColor.cgColor
        self.fillColor = self.fillingColor.cgColor
        self.lineWidth = self.customLineWidth
        
        let layer = CALayer()
        layer.frame = self.bounds
        self.addSublayer(layer)
    }
    
    func animateStrokeColor(fromValue firstValue: UIColor, toValue lastValue: UIColor, duration: CGFloat, autoreverse: Bool) {
        self.animate(WithKeyPath: "strokeColor", fromValue: firstValue, toValue: lastValue, duration: duration, autoreverse: autoreverses)
    }
    
    func animateFillColor(fromValue firstValue: UIColor, toValue lastValue: UIColor, duration: CGFloat, autoreverse: Bool) {
        self.animate(WithKeyPath: "fillColor", fromValue: firstValue, toValue: lastValue, duration: duration, autoreverse: autoreverses)
    }
    
    private func animate(WithKeyPath keyPath: String, fromValue firstValue: UIColor, toValue lastValue: UIColor, duration: CGFloat, autoreverse: Bool) {
        let animColor = CABasicAnimation(keyPath: keyPath)
        animColor.fromValue         = firstValue.cgColor
        animColor.toValue           = lastValue.cgColor
        animColor.duration          = CFTimeInterval(duration)
        animColor.repeatCount       = 0
        animColor.autoreverses      = autoreverses
        self.add(animColor, forKey: keyPath)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
