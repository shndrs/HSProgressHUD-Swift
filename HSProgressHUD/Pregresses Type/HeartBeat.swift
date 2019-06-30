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
        
        setLayers()
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = false
        UIApplication.shared.keyWindow?.addSubview(transView)
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            
            self.transView.alpha = 1
            self.transView.layoutIfNeeded()
        })
    }
    
    public func dismiss(completion: (() -> Void)? = nil) {
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.transView.alpha = 0
            self.transView.layoutIfNeeded()
        }) { _ in
            
            self.transView.removeFromSuperview()
            UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
            completion?()
        }
    }
}

// MARK: Set Animation And Layers

extension HeartBeat: HSProgressAnimation {
    
    public func setLayers() {
        transView.alpha = 0
        titleLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 70)
        titleLabel.center = transView.center
        transView.addSubview(titleLabel)
        layerGenerator(shapeLayer: secondShapeLayer, type: .secondShapeLayer)
        layerGenerator(shapeLayer: thirdShapeLayer, type: .thirdShapeLayer)
        layerGenerator(shapeLayer: firstShapeLayer, type: .firstShapeLayer)
        setAnimation()
    }
    
    public func setAnimation() {
        
        let transformAnimation = HSAnimations.transform(toValue: 1.07, duration: 0.8, option: .easeOut)
        let transformAnimationInnerPulsate = HSAnimations.transform(toValue: 0.95, duration: 1.6, option: .easeOut)
        let opacityAnimation = HSAnimations.opacity()
        let transformXScaleAnimation = HSAnimations.transformX()

        secondShapeLayer.add(transformAnimation, forKey: HSStrings.hsKey0.rawValue)
        thirdShapeLayer.add(transformAnimationInnerPulsate, forKey: HSStrings.hsKey1.rawValue)
        titleLabel.layer.add(opacityAnimation, forKey: HSStrings.hsKey2.rawValue)
        titleLabel.layer.add(transformXScaleAnimation, forKey: HSStrings.hsKey3.rawValue)
    }
}
