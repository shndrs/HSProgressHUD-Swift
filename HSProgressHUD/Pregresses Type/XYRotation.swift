//
//  XYRotation.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class XYRotation: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension XYRotation: HSProgress {
    
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

extension XYRotation: HSProgressAnimation {
    
    public func setLayers() {
        layerGenerator(shapeLayer: mainPulsateShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: secondPulsateShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: mainShapeLayer, type: .track)
        setAnimation()
    }
    
    public func setAnimation() {
        
        let rotationXAnimationx = setAnimationProperties(animation: CABasicAnimation(keyPath: "transform.rotation.x"), duration: 4)
        let rotationYAnimationy = setAnimationProperties(animation: CABasicAnimation(keyPath: "transform.rotation.y"), duration: 2)
        let transformScaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        let secondTransformScaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        
        transformScaleAnimation.toValue = 1.05
        transformScaleAnimation.duration = 1.0
        transformScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transformScaleAnimation.autoreverses = true
        transformScaleAnimation.repeatCount = .infinity
        
        secondTransformScaleAnimation.toValue = 0.7
        secondTransformScaleAnimation.duration = 2.0
        secondTransformScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        secondTransformScaleAnimation.autoreverses = true
        secondTransformScaleAnimation.repeatCount = .infinity
        
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.duration = 0.4
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = .infinity
        
        mainShapeLayer.add(transformScaleAnimation, forKey: "shndrsScaleTransform")
        mainPulsateShapeLayer.add(rotationXAnimationx, forKey: "shndrsRotationXKey")
        mainPulsateShapeLayer.add(secondTransformScaleAnimation, forKey: "sr")
        secondPulsateShapeLayer.add(rotationYAnimationy, forKey: "shndrsRotationYKey")
        secondPulsateShapeLayer.add(secondTransformScaleAnimation, forKey: "rs")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
    }
    
    private func setAnimationProperties(animation:CABasicAnimation, duration: CFTimeInterval) -> CABasicAnimation {
        animation.fromValue = 0
        animation.toValue = CGFloat.pi * 2
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.autoreverses = true
        animation.repeatCount = .infinity
        return animation
    }
}
