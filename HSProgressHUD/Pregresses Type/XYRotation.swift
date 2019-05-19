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

extension XYRotation: HSProgressProtocol {
    
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
        
        let rotationXAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        let rotationYAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        let tarnsformScaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        
        let a = setAnimationProperties(animation: rotationXAnimation, duration: 4)
        let b = setAnimationProperties(animation: rotationYAnimation, duration: 2)
        
        tarnsformScaleAnimation.toValue = 1.05
        tarnsformScaleAnimation.duration = 1.0
        tarnsformScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        tarnsformScaleAnimation.autoreverses = true
        tarnsformScaleAnimation.repeatCount = .infinity
        
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.duration = 0.4
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = .infinity
        
        mainShapeLayer.add(tarnsformScaleAnimation, forKey: "shndrsScaleTransform")
        mainPulsateShapeLayer.add(a, forKey: "shndrsRotationXKey")
        secondPulsateShapeLayer.add(b, forKey: "shndrsRotationYKey")
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
