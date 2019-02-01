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
    case Sin
    case Cos
    case Tan
}

public enum JCWaveDegrees {
    case positive360
    case positive270
    case positive180
    case positive90
    case zero
    case negative90
    case negative180
    case negative270
    case negative360
}

public class JCWaveManager {
    
    private var type: JCWaveType
    
    public init(withType type: JCWaveType) {
        self.type = type
    }
    
    public func getWave(usingDegrees degrees: JCWaveDegrees, time: Double, onPulse pulse: JCPulseView) -> UIBezierPath {
        let centerY = pulse.bounds.height / 2
        let amplitude = CGFloat(30.0) - abs(fmod(CGFloat(time), 3) - 1.5) * 40
        
        func f(_ x: Int)->CGFloat {
            
            switch (self.type) {
            case .Sin:
                return pulse.bounds.width > 0 ? sin(((CGFloat(x) / pulse.bounds.width) + CGFloat(time)) * 4 * self.getDegrees(usingWaveDegrees: degrees)) * amplitude + centerY : 0
            case .Cos:
                return pulse.bounds.width > 0 ? cos(((CGFloat(x) / pulse.bounds.width) + CGFloat(time)) * 4 * self.getDegrees(usingWaveDegrees: degrees)) * amplitude + centerY : 0
            case .Tan:
                return pulse.bounds.width > 0 ? tan(((CGFloat(x) / pulse.bounds.width) + CGFloat(time)) * 4 * self.getDegrees(usingWaveDegrees: degrees)) * amplitude + centerY : 0
            }
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: f(0)))
        for x in stride(from: 0, to: Int(pulse.bounds.width + 9), by: 10) {
            path.addLine(to: CGPoint(x: CGFloat(x), y: f(x)))
        }
        
        return path
    }
    
    public func changeWaveType(to waveType: JCWaveType) {
        self.type = waveType
    }
    
    private func getDegrees(usingWaveDegrees waveDegrees: JCWaveDegrees) -> CGFloat {
        switch (waveDegrees) {
        case .positive360: return .pi * 2
        case .positive270: return .pi * (3/2)
        case .positive180: return .pi
        case .positive90: return .pi / 2
        case .zero: return 0
        case .negative90: return (.pi / 2) * -1
        case .negative180: return .pi * (-1)
        case .negative270: return .pi * (-3/2)
        case .negative360: return .pi * (-2)
        }
    }
    
}
