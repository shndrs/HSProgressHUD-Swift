//
//  XRotation.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class XRotation: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension XRotation: HSProgress {
    
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

extension XRotation: HSProgressAnimation {
    
    public func setLayers() {
        layerGenerator(shapeLayer: mainPulsateShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: secondPulsateShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: mainShapeLayer, type: .track)
        setAnimation()
    }
    
    public func setAnimation() {
        
        let rotationXAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        let transformAnimationInnerPulsate = CABasicAnimation(keyPath: "transform.scale")
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        let tarnsformScaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        rotationXAnimation.fromValue = 0
        rotationXAnimation.toValue = CGFloat.pi * 2
        rotationXAnimation.duration = 4
        rotationXAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        rotationXAnimation.autoreverses = true
        rotationXAnimation.repeatCount = .infinity
        
        transformAnimationInnerPulsate.toValue = 1.1
        transformAnimationInnerPulsate.duration = 0.8
        transformAnimationInnerPulsate.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transformAnimationInnerPulsate.autoreverses = true
        transformAnimationInnerPulsate.repeatCount = .infinity
        
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.duration = 0.4
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = .infinity
        
        tarnsformScaleAnimation.toValue = 1.05
        tarnsformScaleAnimation.duration = 1.0
        tarnsformScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        tarnsformScaleAnimation.autoreverses = true
        tarnsformScaleAnimation.repeatCount = .infinity
        
        mainShapeLayer.add(tarnsformScaleAnimation, forKey: "shndrsScaleTransform")
        mainPulsateShapeLayer.add(rotationXAnimation, forKey: "shndrsRotationXKey")
        secondPulsateShapeLayer.add(transformAnimationInnerPulsate, forKey: "shndrsInnerTransformScaleKey")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
        titleLabel.layer.add(tarnsformScaleAnimation, forKey: "shndrsXTransKey")
    }
}
