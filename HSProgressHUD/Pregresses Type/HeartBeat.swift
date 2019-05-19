//
//  HeartBeat.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class HeartBeat: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension HeartBeat: HSProgress {
    
    public func show() {
        
        transView.alpha = 0
        titleLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 70)
        titleLabel.center = transView.center
        transView.addSubview(titleLabel)
        setLayers()
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
            completion?()
        }
    }
}

// MARK: Set Animation And Layers

extension HeartBeat: HSProgressAnimation {
    
    public func setLayers() {
        layerGenerator(shapeLayer: mainPulsateShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: secondPulsateShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: mainShapeLayer, type: .track)
        setAnimation()
    }
    
    public func setAnimation() {
        
        let transformAnimation = CABasicAnimation(keyPath: "transform.scale")
        let transformAnimationInnerPulsate = CABasicAnimation(keyPath: "transform.scale")
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        let transformXScaleAnimation = CABasicAnimation(keyPath: "transform.scale.x")
        
        transformAnimation.toValue = 1.09
        transformAnimation.duration = 0.8
        transformAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut )
        transformAnimation.autoreverses = true
        transformAnimation.repeatCount = .infinity
        
        transformAnimationInnerPulsate.toValue = 0.95
        transformAnimationInnerPulsate.duration = 1.6
        transformAnimationInnerPulsate.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut )
        transformAnimationInnerPulsate.autoreverses = true
        transformAnimationInnerPulsate.repeatCount = .infinity
        
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.duration = 0.4
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = .infinity
        
        transformXScaleAnimation.fromValue = 1
        transformXScaleAnimation.toValue = 1.02
        transformXScaleAnimation.duration = 1.0
        transformXScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transformXScaleAnimation.autoreverses = true
        transformXScaleAnimation.repeatCount = .infinity
        
        mainPulsateShapeLayer.add(transformAnimation, forKey: "shndrsTransformKey")
        secondPulsateShapeLayer.add(transformAnimationInnerPulsate, forKey: "shndrsInnerTransformKey")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
        titleLabel.layer.add(transformXScaleAnimation, forKey: "shndrsXTransKey")
    }
}
