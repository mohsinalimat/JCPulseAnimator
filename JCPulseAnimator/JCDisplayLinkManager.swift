//
//  JCDisplayLink.swift
//  JCPulseAnimator
//
//  Created by Juan Curti on 31/01/2019.
//  Copyright © 2019 Juan Curti. All rights reserved.
//

import Foundation
import UIKit

public protocol JCDisplayLinkManagerDelegate {
    func displayLinkManagerUpdated(atTime time: Double, manager: JCDisplayLinkManager)
}

public class JCDisplayLinkManager {
    private var displayLink: CADisplayLink?
    private var startTime: CFAbsoluteTime
    
    var delegate: JCDisplayLinkManagerDelegate?
    
    private var frequency: NSInteger = 60
    
    public init() {
        self.startTime = CFAbsoluteTimeGetCurrent()
        
        self.startDisplayLink()
        
    }
    
    public func setFrequency(frequency: NSInteger) {
        self.frequency = frequency
        self.displayLink?.preferredFramesPerSecond = self.frequency
    }
    
    @objc func handleDisplayLink(displayLink: CADisplayLink) {
        let elapsed = CFAbsoluteTimeGetCurrent() - self.startTime
        self.delegate?.displayLinkManagerUpdated(atTime: elapsed, manager: self)
    }
    
    func startDisplayLink() {
        self.displayLink = CADisplayLink(target: self, selector: #selector(self.handleDisplayLink(displayLink:)))
        
        self.displayLink?.preferredFramesPerSecond = self.frequency
        
        if let displayLink = self.displayLink {
            displayLink.add(to: RunLoop.current, forMode: .common)
        }
    }
    
    func stopDisplayLink() {
        if let displayLink = self.displayLink {
            displayLink.invalidate()
        }
    }
    
}
