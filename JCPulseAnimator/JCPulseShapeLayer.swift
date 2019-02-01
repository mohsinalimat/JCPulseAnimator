//
//  JCPulseShapeLayer.swift
//  JCPulseAnimator
//
//  Created by Juan Curti on 31/01/2019.
//  Copyright © 2019 Juan Curti. All rights reserved.
//

import Foundation
import UIKit

/**
 Layer that handles both stroke and fill colors, the line width, and to change colors dynamically or statically.
 **/
public class JCPulseShapeLayer: CAShapeLayer {
    
    /**
     Public constructor for JCPulseShapeLayer. It takes 3 parameters that can be modified either with or without an animation.
     
     - Parameter strokeColor: Color for the line of the pulse graphic. The default value is black.
     - Parameter fillColor: Color for the background between the lines of the animation. The default value is clear.
     - Parameter lineWidth: Width of the line (The one coloured with strokeColor). The default value is 3.0.
     
     **Note: ** All of these values can be modified with the public methods this class has available.
    **/
    init(withStrokeColor strokeColor: UIColor = UIColor.black, fillColor: UIColor = UIColor.clear, lineWidth: CGFloat = 3.0) {
        super.init()
        
        self.strokeColor = strokeColor.cgColor
        self.fillColor = fillColor.cgColor
        self.lineWidth = lineWidth
        
        let layer = CALayer()
        layer.frame = self.bounds
        self.addSublayer(layer)
    }
    
    /**
     Change the color of the graphic's lines instantly.
     
     - Parameter color: Color to change the stroke color to.
     **/
    func changeStrokeColor(to color: UIColor) {
        self.strokeColor = color.cgColor
    }
    
    /**
     Change the color of the graphic's background (Between lines) instantly.
     
     - Parameter color: Color to change the background color to.
     **/
    func changeFillColor(to color: UIColor) {
        self.fillColor = color.cgColor
    }
    
    /**
     Change the line width of the pulse animation instantly.
     
     - Parameter lineWidth: New width to replace instantly the current graphic's line width for.
     **/
    func changeLineWidth(to lineWidth: CGFloat) {
        self.lineWidth = lineWidth
    }
    
    /**
     Change the color of the graphic's lines with an animation, working with 2 colors and switching between these colors during a specific time.
     
     - Parameter fromValue: First color from the animation. The original color can be used here.
     - Parameter toValue: Second color from the animation. As fromValue's, the original color can be used here.
     - Parameter duration: Duration in CGFloat, in seconds
     - Parameter autoreverse: Boolean to specify if the animation should be autoreversed or not.
     **/
    func animateStrokeColor(fromValue firstValue: UIColor, toValue lastValue: UIColor, duration: CGFloat, autoreverse: Bool) {
        self.animate(WithKeyPath: "strokeColor", fromValue: firstValue, toValue: lastValue, duration: duration, autoreverse: autoreverses)
    }
    
    /**
     Change the color of the graphic's background with an animation, working with 2 colors and switching between these colors during a specific time.
     
     - Parameter fromValue: First color from the animation. The original color can be used here.
     - Parameter toValue: Second color from the animation. As fromValue's, the original color can be used here.
     - Parameter duration: Duration in CGFloat, in seconds
     - Parameter autoreverse: Boolean to specify if the animation should be autoreversed or not.
     **/
    func animateFillColor(fromValue firstValue: UIColor, toValue lastValue: UIColor, duration: CGFloat, autoreverse: Bool) {
        self.animate(WithKeyPath: "fillColor", fromValue: firstValue, toValue: lastValue, duration: duration, autoreverse: autoreverses)
    }
    
    /**
     Change the line's width of the pulse animation during a specific amount of time..
     
     - Parameter fromValue: First line width for the animation. The original width can be used here.
     - Parameter toValue: Second line width for the animation. As fromValue's, the original width can be used here.
     - Parameter duration: Duration in CGFloat, in seconds
     - Parameter autoreverse: Boolean to specify if the animation should be autoreversed or not.
     **/
    func animateLineWidth(fromValue firstValue: CGFloat, toValue lastValue: CGFloat, duration: CGFloat, autoreverse: Bool) {
        let animWidth = CABasicAnimation(keyPath: "lineWidth")
        animWidth.fromValue         = firstValue
        animWidth.toValue           = lastValue
        animWidth.duration          = CFTimeInterval(duration)
        animWidth.repeatCount       = 0
        animWidth.autoreverses      = autoreverses
        self.add(animWidth, forKey: "lineWidth")
    }
    
    /**
     Method to handle animations for both stroke and fill color changing. Takes same parameters that animateStrokeColor and animateFillColor, adding a keyPath to detect which color are we refering to.
     
     - Parameter keyPath: Keypath to detect what element we want to make an animation on.
     - Parameter fromValue: First color from the animation. The original color can be used here.
     - Parameter toValue: Second color from the animation. As fromValue's, the original color can be used here.
     - Parameter duration: Duration in CGFloat, in seconds
     - Parameter autoreverse: Boolean to specify if the animation should be autoreversed or not.
     **/
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
