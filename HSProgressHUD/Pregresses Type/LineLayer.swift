//
//  LineLayer.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class LineLayer: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension LineLayer: HSProgress {
    
    public func show() {
        
        setLayers()
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = false
        UIApplication.shared.keyWindow?.addSubview(transView)
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            
            self.transView.alpha = 1
            self.transView.layoutIfNeeded()
        })
    }
    
    public func dismiss(completion: (() -> Void)?) {
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            
            self.transView.alpha = 0
            self.transView.layoutIfNeeded()
            
        }) { (success) in
            
            self.transView.removeFromSuperview()
            UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
            completion?()
        }
    }
}

// MARK: Set Animation And Layers

extension LineLayer: HSProgressAnimation {
    
    public func setLayers() {
        transView.alpha = 0
        titleLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 70)
        titleLabel.center = transView.center
        transView.addSubview(titleLabel)
        layerGenerator(shapeLayer: secondShapeLayer, type: .secondShapeLayer)
        layerGenerator(shapeLayer: thirdShapeLayer, type: .thirdShapeLayer)
        layerGenerator(shapeLayer: firstShapeLayer, type: .firstShapeLayer)
        setAnimation()
    }
    
    public func setAnimation() {
        
        firstShapeLayer.lineWidth = 5.0
        
        
        
        
        
        firstShapeLayer.lineDashPattern = [5]
        
        let lineDashPhaseAnimation = CABasicAnimation(keyPath: "lineDashPhase")
        lineDashPhaseAnimation.byValue = 10.0
        lineDashPhaseAnimation.duration = 0.75
        lineDashPhaseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        lineDashPhaseAnimation.repeatCount = .greatestFiniteMagnitude
        
        firstShapeLayer.add(lineDashPhaseAnimation, forKey: "lineDashPhaseAnimation")
        

        
        
        let lineWidthAnimation = HSAnimations.lineWidth(toValue: 15.0, duration: 1.3)
        let secondLineWidthAnimation = HSAnimations.lineWidth(toValue: 18.0, duration: 0.8)
        let thirdLineWidthAnimation = HSAnimations.lineWidth(toValue: 20.0, duration: 2)
        let opacityAnimation = HSAnimations.opacity()

        secondShapeLayer.add(opacityAnimation, forKey: HSStrings.hsKey0.rawValue)
        secondShapeLayer.add(secondLineWidthAnimation, forKey: HSStrings.hsKey1.rawValue)
        thirdShapeLayer.add(thirdLineWidthAnimation, forKey: HSStrings.hsKey2.rawValue)
        titleLabel.layer.add(opacityAnimation, forKey: HSStrings.hsKey3.rawValue)
//        firstShapeLayer.add(lineWidthAnimation, forKey: HSStrings.hsKey4.rawValue)
    }
}
