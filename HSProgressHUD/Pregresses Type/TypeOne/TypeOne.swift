//
//  TypeOne.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class TypeOne: HSBaseView, HSProgressAnimation, HSProgressProtocol {
    
    func show() {
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
    
    func dismiss(completion: (() -> Void)?) {
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.transView.alpha = 0
            self.transView.layoutIfNeeded()
        }) { (success) in
            
            self.transView.removeFromSuperview()
            completion?()
        }
    }
    
    internal func setLayers() {
        layerGenerator(shapeLayer: mainPulsateShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: secondPulsateShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: mainShapeLayer, type: .track)
        setAnimation()
    }
    
    internal func setAnimation() {
        
        let transformAnimation = CABasicAnimation(keyPath: "transform.scale")
        let transformAnimationInnerPulsate = CABasicAnimation(keyPath: "transform.scale")
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        let tarnsformXScaleAnimation = CABasicAnimation(keyPath: "transform.scale.x")
        
        transformAnimation.toValue = 1.13
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
        
        tarnsformXScaleAnimation.fromValue = 1
        tarnsformXScaleAnimation.toValue = 1.02
        tarnsformXScaleAnimation.duration = 1.0
        tarnsformXScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        tarnsformXScaleAnimation.autoreverses = true
        tarnsformXScaleAnimation.repeatCount = .infinity
        
        mainPulsateShapeLayer.add(transformAnimation, forKey: "shndrsTransformKey")
        secondPulsateShapeLayer.add(transformAnimationInnerPulsate, forKey: "shndrsInnerTransformKey")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
        titleLabel.layer.add(tarnsformXScaleAnimation, forKey: "shndrsXTransKey")
    }
}
