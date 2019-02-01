//
//  JCDisplayLink.swift
//  JCPulseAnimator
//
//  Created by Juan Curti on 31/01/2019.
//  Copyright © 2019 Juan Curti. All rights reserved.
//

import Foundation
import UIKit

/**
 Delegate for JCDisplayLinkManager
 **/
public protocol JCDisplayLinkManagerDelegate {
    
    /**
     Method that is called each time CADisplayLink wants to update the screen.
     
     - Parameter time: Returns the exact time when CADisplayLink wants to make an update.
     **/
    func displayLinkManagerUpdated(didUpdateAtTime time: Double)
}

/**
 Manager to handle CADisplayLink, which is a timer in charge of synchronizing the drawing to the refresh rate of the display.
 **/
public class JCDisplayLinkManager {
    
    /// A timer object that allows your application to synchronize its drawing to the refresh rate of the display. (According to Apple's Documentation)
    private var displayLink: CADisplayLink?
    
    /// CFAbsoluteTime to handle the start time
    private var startTime: CFAbsoluteTime
    
    /**
    Delegate that responds to JCDisplayLinkManagerDelegate.
     
     - Requires: displayLinkManagerUpdated(didUpdateAtTime: Double)
    **/
    var delegate: JCDisplayLinkManagerDelegate?
    
    /// Value to change the refresh rate of the display. By default is 60.
    private var frequency: NSInteger = 60
    
    /**
     Public constructor to generate a JCDisplayLinkManager. Starts automatically with the displayLink animation.
     **/
    public init() {
        self.startTime = CFAbsoluteTimeGetCurrent()
        
        self.startDisplayLink()
        
    }
    
    /**
     Method to change the frequency dynamically.
     
     - Parameter frequency: Value to change the refresh rate of the display. By default is 60.
     **/
    public func setFrequency(frequency: NSInteger) {
        self.frequency = frequency
        self.displayLink?.preferredFramesPerSecond = self.frequency
    }
    
    /**
     Method called as a selector of CADisplayLink when it wants to refresh the screen. This is used so this delegate method is received by JCPulseView, and this interacts with the JCPulseShapeLayer to draw the path that makes the graphic.
     **/
    @objc func handleDisplayLink(displayLink: CADisplayLink) {
        let elapsed = CFAbsoluteTimeGetCurrent() - self.startTime
        self.delegate?.displayLinkManagerUpdated(didUpdateAtTime: elapsed)
    }
    
    /**
     Method to start the animation if it was paused before.
     **/
    func startDisplayLink() {
        self.displayLink = CADisplayLink(target: self, selector: #selector(self.handleDisplayLink(displayLink:)))
        
        self.displayLink?.preferredFramesPerSecond = self.frequency
        
        if let displayLink = self.displayLink {
            displayLink.add(to: RunLoop.current, forMode: .common)
        }
    }
    
    /**
     Method to stop the animation. Can be restarted using the function startAnimation()
     **/
    func stopDisplayLink() {
        if let displayLink = self.displayLink {
            displayLink.invalidate()
        }
    }
    
}
