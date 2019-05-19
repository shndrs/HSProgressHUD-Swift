//
//  LordOfTheRings.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class LordOfTheRings: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension LordOfTheRings: HSProgress {
    
    public func show() {
        
        transView.alpha = 0
        titleLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 110)
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

extension LordOfTheRings: HSProgressAnimation {
    
    public func setLayers() {
        layerGenerator(shapeLayer: mainPulsateShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: secondPulsateShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: mainShapeLayer, type: .track)
        setAnimation()
    }
    
    public func setAnimation() {
        
        let mainPulsateAnimation = CABasicAnimation(keyPath: "transform.scale")
        let transformAnimationInnerPulsate = CABasicAnimation(keyPath: "transform.scale")
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        let transformScaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
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
        
        transformScaleAnimation.toValue = 1.05
        transformScaleAnimation.duration = 1.0
        transformScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transformScaleAnimation.autoreverses = true
        transformScaleAnimation.repeatCount = .infinity
        
        mainPulsateAnimation.toValue = 0.9
        mainPulsateAnimation.fromValue = 1.14
        mainPulsateAnimation.duration = 2
        mainPulsateAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        mainPulsateAnimation.autoreverses = true
        mainPulsateAnimation.repeatCount = .infinity
        
        mainShapeLayer.add(transformScaleAnimation, forKey: "shndrsScaleTransform")
        mainPulsateShapeLayer.add(mainPulsateAnimation, forKey: "shndrsMainPulsateKey")
        secondPulsateShapeLayer.add(transformAnimationInnerPulsate, forKey: "shndrsInnerTransformScaleKey")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
        titleLabel.layer.add(transformScaleAnimation, forKey: "shndrsXTransKey")
    }
}
