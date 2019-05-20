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
        layerGenerator(shapeLayer: secondShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: thirdShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: firstShapeLayer, type: .track)
        setAnimation()
    }
    
    public func setAnimation() {
        
        let rotationXAnimation = HSAnimations.rotationX(duration: 4)
        let transformAnimationInnerPulsate = HSAnimations.transform(toValue: 1.1, duration: 0.8, option: .easeOut)
        let opacityAnimation = HSAnimations.opacity()
        let transformScaleAnimation = HSAnimations.transform(toValue: 1.05, duration: 1.0, option: .easeInEaseOut)
        
        firstShapeLayer.add(transformScaleAnimation, forKey: "shndrsScaleTransform")
        secondShapeLayer.add(rotationXAnimation, forKey: "shndrsRotationXKey")
        thirdShapeLayer.add(transformAnimationInnerPulsate, forKey: "shndrsInnerTransformScaleKey")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
        titleLabel.layer.add(transformScaleAnimation, forKey: "shndrsXTransKey")
    }
}
