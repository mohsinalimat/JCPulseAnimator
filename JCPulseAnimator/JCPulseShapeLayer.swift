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
    init(withStrokeColor strokeColor: UIColor = UIColor.black, fillColor: UIColor = UIColor.clear, lineWidth: CGFloat = 3.0) {
        super.init()
        
        self.strokeColor = strokeColor.cgColor
        self.fillColor = fillColor.cgColor
        self.lineWidth = lineWidth
        
        let layer = CALayer()
        layer.frame = self.bounds
        self.addSublayer(layer)
    }
    
    func changeStrokeColor(to color: UIColor) {
        self.strokeColor = color.cgColor
    }
    
    func changeFillColor(to color: UIColor) {
        self.fillColor = color.cgColor
    }
    
    func changeLineWidth(to lineWidth: CGFloat) {
        self.lineWidth = lineWidth
    }
    
    func animateStrokeColor(fromValue firstValue: UIColor, toValue lastValue: UIColor, duration: CGFloat, autoreverse: Bool) {
        self.animate(WithKeyPath: "strokeColor", fromValue: firstValue, toValue: lastValue, duration: duration, autoreverse: autoreverses)
    }
    
    func animateFillColor(fromValue firstValue: UIColor, toValue lastValue: UIColor, duration: CGFloat, autoreverse: Bool) {
        self.animate(WithKeyPath: "fillColor", fromValue: firstValue, toValue: lastValue, duration: duration, autoreverse: autoreverses)
    }
    
    func animateLineWidth(fromValue firstValue: CGFloat, toValue lastValue: CGFloat, duration: CGFloat, autoreverse: Bool) {
        self.animate(FromValue: firstValue, toValue: lastValue, duration: duration, autoreverse: autoreverse)
    }
    
    private func animate(FromValue firstValue: CGFloat, toValue lastValue: CGFloat, duration: CGFloat, autoreverse: Bool) {
        let animWidth = CABasicAnimation(keyPath: "lineWidth")
        animWidth.fromValue         = firstValue
        animWidth.toValue           = lastValue
        animWidth.duration          = CFTimeInterval(duration)
        animWidth.repeatCount       = 0
        animWidth.autoreverses      = autoreverses
        self.add(animWidth, forKey: "lineWidth")
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
