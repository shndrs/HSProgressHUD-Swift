//
//  TypeThree.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class LineLayer: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension LineLayer: HSProgressProtocol {
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

extension LineLayer: HSProgressAnimation {
    
    public func setLayers() {
        layerGenerator(shapeLayer: mainPulsateShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: secondPulsateShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: mainShapeLayer, type: .track)
        setAnimation()
    }
    
    public func setAnimation() {
        
        mainShapeLayer.lineWidth = 5.0
        
        let lineWidthAnimation = CABasicAnimation(keyPath: "lineWidth")
        let transformAnimation = CABasicAnimation(keyPath: "lineWidth")
        let transformAnimationInnerPulsate = CABasicAnimation(keyPath: "lineWidth")
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        let tarnsformXScaleAnimation = CABasicAnimation(keyPath: "lineWidth")
        
        lineWidthAnimation.toValue = 20.0
        lineWidthAnimation.duration = 1.5
        lineWidthAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        lineWidthAnimation.autoreverses = true
        lineWidthAnimation.repeatCount = .greatestFiniteMagnitude
        
        transformAnimation.toValue = 20.0
        transformAnimation.duration = 1
        transformAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transformAnimation.autoreverses = true
        transformAnimation.repeatCount = .greatestFiniteMagnitude
        
        transformAnimationInnerPulsate.toValue = 15.0
        transformAnimationInnerPulsate.duration = 2
        transformAnimationInnerPulsate.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transformAnimationInnerPulsate.autoreverses = true
        transformAnimationInnerPulsate.repeatCount = .greatestFiniteMagnitude
        
        tarnsformXScaleAnimation.toValue = 10.0
        tarnsformXScaleAnimation.duration = 2.5
        tarnsformXScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        tarnsformXScaleAnimation.autoreverses = true
        tarnsformXScaleAnimation.repeatCount = .greatestFiniteMagnitude
        
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.duration = 0.4
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = .infinity

        mainPulsateShapeLayer.add(opacityAnimation, forKey: "mainPulsateOpacity")
        mainPulsateShapeLayer.add(transformAnimation, forKey: "shndrsRotationKey")
        secondPulsateShapeLayer.add(transformAnimationInnerPulsate, forKey: "shndrsInnerTransformKey")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
        mainShapeLayer.add(lineWidthAnimation, forKey: "lineWidthAnimation")
    }
}
