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
    private let waveManager: JCWaveManager
    private let pulseShapeLayer: JCPulseShapeLayer
    
    private var waveType: JCWaveType
    
    public init(withWaveType waveType: JCWaveType, strokeColor: UIColor?, fillColor: UIColor?, lineWidth: CGFloat?) {
        self.displayLinkManager = JCDisplayLinkManager()
        self.waveManager = JCWaveManager()
        self.pulseShapeLayer = JCPulseShapeLayer(
            withStrokeColor: strokeColor ?? UIColor.black,
            fillColor: fillColor ?? UIColor.clear,
            lineWidth: lineWidth ?? 3.0
        )
        
        self.waveType = waveType
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.addSublayer(self.pulseShapeLayer)
        
        self.displayLinkManager.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // JCDisplayLinkManagerDelegate
    public func displayLinkManagerUpdated(atTime time: Double, manager: JCDisplayLinkManager) {
        self.pulseShapeLayer.path = self.waveManager.getWave(withType: .Alpha, usingTime: time, onPulse: self).cgPath
    }
    
}
