//
//  JCPulseShapeLayer.swift
//  JCPulseAnimator
//
//  Created by Juan Curti on 31/01/2019.
//  Copyright © 2019 Juan Curti. All rights reserved.
//

import Foundation
import UIKit

internal class JCPulseShapeLayer: CAShapeLayer {
    private var strokingColor: UIColor
    private var fillingColor: UIColor
    private var customLineWidth: CGFloat
    
    init(withStrokeColor strokeColor: UIColor = UIColor.black, fillColor: UIColor = UIColor.clear, lineWidth: CGFloat = 3.0) {
        self.strokingColor = strokeColor
        self.fillingColor = fillColor
        self.customLineWidth = lineWidth
        
        super.init()
        
        self.strokeColor = self.strokingColor.cgColor
        self.fillColor = self.fillingColor.cgColor
        self.lineWidth = self.customLineWidth
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
