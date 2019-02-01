//
//  JCPulseView.swift
//  JCPulseAnimator
//
//  Created by Juan Curti on 31/01/2019.
//  Copyright © 2019 Juan Curti. All rights reserved.
//

import Foundation
import UIKit

/**
 Main interface to access JCPulseView. From here you can access all public declared methods to customize it.
**/
public class JCPulseView: UIView, JCDisplayLinkManagerDelegate {
    
    /// Manager to handle CADisplayLink, which is a timer in charge of synchronizing the drawing to the refresh rate of the display.
    private let displayLinkManager: JCDisplayLinkManager
    
    /// Manager to draw the pulses according to the trigonometrical function related and the degrees associated.
    private let waveManager: JCWaveManager
    
    /// Layer that handles both stroke and fill colors, the line width, and to change colors dinamically or statically.
    private let pulseShapeLayer: JCPulseShapeLayer
    
    /// Enum that returns degrees in PI. The value can be either positive or negative, between 90, 180, 270 and 360 degrees, apart of zero.
    private let degrees: JCWaveDegrees
    
    /**
     Public constructor to access JCPulseView. It takes a few arguments, some of them with default value.
     
     - Parameter waveType: Select the trigonometrical function that will be used to draw the pulse animation. Of the type JCWaveType, it can take values for Sin, Cos and Tan.
     - Parameter degrees: Choose a degree from the available degrees between -360 and 360 degrees. Of the type JCWaveDegrees, it can take values for either positive or negative 90, 180, 270 and 360 degrees, apart from zero.
     - Parameter strokeColor: Choose the color for the line of the pulse graphic. The default value is black. **Note** that this can be changed dinamically with or without an animation.
     - Parameter fillColor: Choose the fill color between the lines of the pulse graphic. The default value is clear. **Note** that this can be changed dinamically with or without an animation.
     - Parameter lineWidth: Width of the lines of the graphic.
     
     **/
    public init(withWaveType waveType: JCWaveType, degrees: JCWaveDegrees, strokeColor: UIColor?, fillColor: UIColor?, lineWidth: CGFloat?) {
        self.displayLinkManager = JCDisplayLinkManager()
        self.waveManager = JCWaveManager(withType: waveType)
        self.pulseShapeLayer = JCPulseShapeLayer(
            withStrokeColor: strokeColor ?? UIColor.black,
            fillColor: fillColor ?? UIColor.clear,
            lineWidth: lineWidth ?? 3.0
        )
        
        self.degrees = degrees
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.addSublayer(self.pulseShapeLayer)
        
        self.displayLinkManager.delegate = self
    }
    
    /**
     Method to start the animation if it was paused before.
     **/
    public func startAnimation() {
        self.displayLinkManager.startDisplayLink()
    }
    
    /**
     Method to stop the animation. Can be restarted using the function startAnimation()
     **/
    public func stopAnimation() {
        self.displayLinkManager.stopDisplayLink()
    }
    
    /**
     Change the pulse frequency, which is by default on 60. **Note: ** To get different results, try to put a value between 0 and 20/30.
     **/
    public func changePulseFrequency(withValue value: NSInteger) {
        self.displayLinkManager.setFrequency(frequency: value)
    }
    
    /**
     Change the color of the graphic's lines instantly.
     **/
    public func changeStrokeColor(to color: UIColor) {
        self.pulseShapeLayer.changeStrokeColor(to: color)
    }
    
    /**
     Change the color of the graphic's background (Between lines) instantly.
     **/
    public func changeFillColor(to color: UIColor) {
        self.pulseShapeLayer.changeFillColor(to: color)
    }
    
    /**
     Change the line width of the pulse animation instantly.
     **/
    public func changeLineWidth(to lineWidth: CGFloat) {
        self.pulseShapeLayer.changeLineWidth(to: lineWidth)
    }
    
    /**
     Change the color of the graphic's lines with an animation, working with 2 colors and switching between these colors during a specific time.
     
     -Parameter fromValue: First color from the animation. The original color can be used here.
     -Parameter toValue: Second color from the animation. As fromValue's, the original color can be used here.
     -Parameter duration: Duration in CGFloat, in seconds
     -Parameter autoreverse: Boolean to specify if the animation should be autoreversed or not.
     **/
    public func changeStrokeColorAnimated(fromValue firstValue: UIColor, toValue lastValue: UIColor, duration: CGFloat, autoreverse: Bool) {
        self.pulseShapeLayer.animateStrokeColor(fromValue: firstValue, toValue: lastValue, duration: duration, autoreverse: autoreverse)
    }
    
    /**
     Change the color of the graphic's background with an animation, working with 2 colors and switching between these colors during a specific time.
     
     -Parameter fromValue: First color from the animation. The original color can be used here.
     -Parameter toValue: Second color from the animation. As fromValue's, the original color can be used here.
     -Parameter duration: Duration in CGFloat, in seconds
     -Parameter autoreverse: Boolean to specify if the animation should be autoreversed or not.
     **/
    public func changeFillColorAnimated(fromValue firstValue: UIColor, toValue lastValue: UIColor, duration: CGFloat, autoreverse: Bool) {
        self.pulseShapeLayer.animateFillColor(fromValue: firstValue, toValue: lastValue, duration: duration, autoreverse: autoreverse)
    }
    
    /**
     Change the line's width of the pulse animation during a specific amount of time..
     
     -Parameter fromValue: First line width for the animation. The original width can be used here.
     -Parameter toValue: Second line width for the animation. As fromValue's, the original width can be used here.
     -Parameter duration: Duration in CGFloat, in seconds
     -Parameter autoreverse: Boolean to specify if the animation should be autoreversed or not.
     **/
    public func changeLineWidthAnimated(fromValue firstValue: CGFloat, toValue lastValue: CGFloat, duration: CGFloat, autoreverse: Bool) {
        self.pulseShapeLayer.animateLineWidth(fromValue: firstValue, toValue: lastValue, duration: duration, autoreverse: autoreverse)
    }
    
    /**
     Method to change the wave type. Can be used in the middle of an animation or isolated.
     **/
    public func changeWaveType(to waveType: JCWaveType) {
        self.waveManager.changeWaveType(to: waveType)
    }
    
    /**
     Delegate from JCPulseView (Specific class is JCDisplayLinkManagerDelegate). This delegate method is called in every cycle created by the display link.
     **/
    public func displayLinkManagerUpdated(atTime time: Double) {
        self.pulseShapeLayer.path = self.waveManager.getWave(usingDegrees: self.degrees, time: time, onPulse: self).cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
