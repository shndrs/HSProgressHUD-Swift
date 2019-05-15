//
//  TypeFour.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class TypeFour: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension TypeFour: HSProgressProtocol {
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
}

// MARK: Set Animation And Layers

extension TypeFour: HSProgressAnimation {
    
    internal func setLayers() {
        layerGenerator(shapeLayer: mainPulsateShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: secondPulsateShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: mainShapeLayer, type: .track)
        setAnimation()
    }
    
    internal func setAnimation() {
        
        
        
        mainShapeLayer.lineDashPattern = [5]
        
        let lineDashPhaseAnimation = CABasicAnimation(keyPath: "lineDashPhase")
        lineDashPhaseAnimation.byValue = 5
        lineDashPhaseAnimation.duration = 0.75
        lineDashPhaseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        lineDashPhaseAnimation.repeatCount = .greatestFiniteMagnitude
        
        mainShapeLayer.add(lineDashPhaseAnimation, forKey: "lineDashPhaseAnimation")
        

        
        
        let transformAnimation = CABasicAnimation(keyPath: "lineWidth")
        let transformAnimationInnerPulsate = CABasicAnimation(keyPath: "lineWidth")
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
//        let tarnsformXScaleAnimation = CABasicAnimation(keyPath: "lineWidth")

        
        transformAnimationInnerPulsate.toValue = 15.0
        transformAnimationInnerPulsate.duration = 2
        transformAnimationInnerPulsate.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transformAnimationInnerPulsate.autoreverses = true
        transformAnimationInnerPulsate.repeatCount = .greatestFiniteMagnitude

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
    }
}

