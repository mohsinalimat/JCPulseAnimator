//
//  JCPulseView.swift
//  JCPulseAnimator
//
//  Created by Juan Curti on 31/01/2019.
//  Copyright © 2019 Juan Curti. All rights reserved.
//

import Foundation
import UIKit

public class JCPulseView: UIView {
    private var displayLink: CADisplayLink?
    private var startTime: CFAbsoluteTime?
    private let pulseShapeLayer: JCPulseShapeLayer
    
    init(withStrokeColor strokeColor: UIColor = UIColor.black, fillColor: UIColor = UIColor.clear, lineWidth: CGFloat = 3.0) {
        self.pulseShapeLayer = JCPulseShapeLayer(withStrokeColor: strokeColor, fillColor: fillColor, lineWidth: lineWidth)
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.addSublayer(self.pulseShapeLayer)
        
        self.startDisplayLink()
    }
    
    func stop() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    private func startDisplayLink() {
        self.startTime = CFAbsoluteTimeGetCurrent()
        displayLink?.invalidate()
        displayLink = CADisplayLink(target: self, selector: #selector(handleDisplayLink(displayLink:)))
        displayLink?.add(to: RunLoop.current, forMode: .common)
    }
    
    @objc func handleDisplayLink(displayLink: CADisplayLink) {
        guard let startTime = self.startTime else { return }
        let elapsed = CFAbsoluteTimeGetCurrent() - startTime
        self.pulseShapeLayer.path = self.wave(at: elapsed).cgPath
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
    
}
