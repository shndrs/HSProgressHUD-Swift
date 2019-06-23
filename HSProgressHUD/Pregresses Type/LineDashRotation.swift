//
//  LineDashRotation.swift
//  HSProgressHUD
//
//  Created by NP2 on 6/23/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class LineDashRotation: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension LineDashRotation: HSProgress {
    
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

extension LineDashRotation: HSProgressAnimation {
    
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
        
        secondShapeLayer.lineWidth = 5.0
        secondShapeLayer.lineDashPattern = [5]
        
        thirdShapeLayer.lineWidth = 5.0
        thirdShapeLayer.lineDashPattern = [5]
        
        firstShapeLayer.strokeStart = 0.0
        firstShapeLayer.strokeEnd = 0.0
        
        let rotationXAnimation = HSAnimations.rotationX(duration: 6)
        let rotationYAnimation = HSAnimations.rotationY(duration: 3)
        let transformScaleAnimation = HSAnimations.transform(toValue: 1.06, duration: 1.0, option: .easeInEaseOut)
        let opacityAnimation = HSAnimations.opacity()
        let a = HSAnimations.lineDashPhase(byValue: 18.0, duration: 0.75)
        let b = HSAnimations.strokeEndAnimation()
        
        firstShapeLayer.add(a, forKey: "lkj")
        secondShapeLayer.add(a, forKey: "jkl")
        thirdShapeLayer.add(a, forKey: "ljk")
        firstShapeLayer.add(b, forKey: "jhg")
        firstShapeLayer.add(transformScaleAnimation, forKey: HSStrings.hsKey0.rawValue)
        secondShapeLayer.add(rotationXAnimation, forKey: HSStrings.hsKey1.rawValue)
        thirdShapeLayer.add(rotationYAnimation, forKey: HSStrings.hsKey2.rawValue)
        titleLabel.layer.add(opacityAnimation, forKey: HSStrings.hsKey3.rawValue)
    }
}

