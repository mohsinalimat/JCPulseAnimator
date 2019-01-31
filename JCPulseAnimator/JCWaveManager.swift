//
//  JCWave.swift
//  JCPulseAnimator
//
//  Created by Juan Curti on 31/01/2019.
//  Copyright © 2019 Juan Curti. All rights reserved.
//

import Foundation
import UIKit

public enum JCWaveType {
    case Alpha
}

public class JCWaveManager {
    
    public init() {
        
    }
    
    public func getWave(withType type: JCWaveType, usingTime time: Double, onPulse pulse: JCPulseView) -> UIBezierPath {
        
        switch(type) {
        case .Alpha:
            return self.getAlphaWave(usingTime: time, onPulse: pulse)
        }
        
    }
    
    private func getAlphaWave(usingTime time: Double, onPulse pulse: JCPulseView) -> UIBezierPath {
        let centerY = pulse.bounds.height / 2
        let amplitude = CGFloat(30.0) - abs(fmod(CGFloat(time), 3) - 1.5) * 40
        
        func f(_ x: Int)->CGFloat {
            return pulse.bounds.width > 0 ? sin(((CGFloat(x) / pulse.bounds.width) + CGFloat(time)) * 4 * .pi) * amplitude + centerY : 0
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: f(0)))
        for x in stride(from: 0, to: Int(pulse.bounds.width + 9), by: 10) {
            path.addLine(to: CGPoint(x: CGFloat(x), y: f(x)))
        }
        
        return path
    }
    
}
