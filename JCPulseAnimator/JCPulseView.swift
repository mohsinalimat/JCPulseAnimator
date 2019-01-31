//
//  JCPulseView.swift
//  JCPulseAnimator
//
//  Created by Juan Curti on 31/01/2019.
//  Copyright © 2019 Juan Curti. All rights reserved.
//

import Foundation
import UIKit

public class JCPulseView: UIView, JCDisplayLinkManagerDelegate {
    private let displayLinkManager: JCDisplayLinkManager
    private let pulseShapeLayer: JCPulseShapeLayer
    
    public init(withStrokeColor strokeColor: UIColor?, fillColor: UIColor?, lineWidth: CGFloat?) {
        self.displayLinkManager = JCDisplayLinkManager()
        self.pulseShapeLayer = JCPulseShapeLayer(
            withStrokeColor: strokeColor ?? UIColor.black,
            fillColor: fillColor ?? UIColor.clear,
            lineWidth: lineWidth ?? 3.0
        )
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.addSublayer(self.pulseShapeLayer)
        
        
        self.displayLinkManager.delegate = self
    }
    
    private func wave(at elapsed: Double)->UIBezierPath {
        let centerY = self.bounds.height / 2
        let amplitude = CGFloat(30.0) - abs(fmod(CGFloat(elapsed), 3) - 1.5) * 40
        
        func f(_ x: Int)->CGFloat {
            return self.bounds.width > 0 ? sin(((CGFloat(x) / self.bounds.width) + CGFloat(elapsed)) * 4 * .pi) * amplitude + centerY : 0
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: f(0)))
        for x in stride(from: 0, to: Int(self.bounds.width + 9), by: 10) {
            path.addLine(to: CGPoint(x: CGFloat(x), y: f(x)))
        }
        
        return path
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // JCDisplayLinkManagerDelegate
    public func displayLinkManagerUpdated(atTime time: Double, manager: JCDisplayLinkManager) {
        self.pulseShapeLayer.path = self.wave(at: time).cgPath
    }
    
}
