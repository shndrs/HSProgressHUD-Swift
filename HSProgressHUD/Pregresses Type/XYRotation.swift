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
        layerGenerator(shapeLayer: secondShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: thirdShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: firstShapeLayer, type: .track)
        setAnimation()
    }
    
    public func setAnimation() {
        
        let rotationXAnimation = HSAnimations.rotationX(duration: 4)
        let rotationYAnimation = HSAnimations.rotationY(duration: 2)
        let transformScaleAnimation = HSAnimations.transform(toValue: 1.05, duration: 1.0, option: .easeInEaseOut)
        let secondTransformScaleAnimation = HSAnimations.transform(toValue: 0.7, duration: 2.0, option: .easeInEaseOut)
        let opacityAnimation = HSAnimations.opacity()
        
        firstShapeLayer.add(transformScaleAnimation, forKey: "shndrsScaleTransform")
        secondShapeLayer.add(rotationXAnimation, forKey: "shndrsRotationXKey")
        secondShapeLayer.add(secondTransformScaleAnimation, forKey: "scaleDownKey")
        thirdShapeLayer.add(rotationYAnimation, forKey: "shndrsRotationYKey")
        thirdShapeLayer.add(secondTransformScaleAnimation, forKey: "secondScaleDownKey")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
    }
}
