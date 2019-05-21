//
//  HSAnimations.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public class HSAnimations {
    
    private init() {}
    
    public static func transform(fromValue:Any = 1, toValue: Any, duration: CFTimeInterval, option:CAMediaTimingFunctionName) -> CABasicAnimation {
        
        let transformScaleAnimation = CABasicAnimation(keyPath: AnimationKeyPath.transformScale.rawValue)
        
        transformScaleAnimation.toValue = toValue
        transformScaleAnimation.duration = duration
        transformScaleAnimation.timingFunction = CAMediaTimingFunction(name: option)
        transformScaleAnimation.autoreverses = true
        transformScaleAnimation.repeatCount = .infinity
        
        return transformScaleAnimation
    }

    public static func transformX() -> CABasicAnimation {
        
        let transformXScaleAnimation = CABasicAnimation(keyPath: AnimationKeyPath.transformScaleX.rawValue)
        
        transformXScaleAnimation.fromValue = 1
        transformXScaleAnimation.toValue = 1.02
        transformXScaleAnimation.duration = 1.0
        transformXScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transformXScaleAnimation.autoreverses = true
        transformXScaleAnimation.repeatCount = .infinity
        
        return transformXScaleAnimation
    }
    
    public static func rotationX(duration: CFTimeInterval) -> CABasicAnimation {
        
        let rotationXAnimation = CABasicAnimation(keyPath: AnimationKeyPath.transformRotationX.rawValue)
        
        rotationXAnimation.fromValue = 0
        rotationXAnimation.toValue = CGFloat.pi * 2
        rotationXAnimation.duration = duration
        rotationXAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        rotationXAnimation.autoreverses = true
        rotationXAnimation.repeatCount = .infinity
        
        return rotationXAnimation
    }
    
    public static func rotationY(duration: CFTimeInterval) -> CABasicAnimation {
        
        let rotationXAnimation = CABasicAnimation(keyPath: AnimationKeyPath.transformRotationY.rawValue)
        
        rotationXAnimation.fromValue = 0
        rotationXAnimation.toValue = CGFloat.pi * 2
        rotationXAnimation.duration = duration
        rotationXAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        rotationXAnimation.autoreverses = true
        rotationXAnimation.repeatCount = .infinity
        
        return rotationXAnimation
    }
    
    public static func opacity() -> CABasicAnimation {
        
        let opacityAnimation = CABasicAnimation(keyPath: AnimationKeyPath.opacity.rawValue)
        
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.duration = 0.4
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = .infinity
        
        return opacityAnimation
    }
    
    public static func lineWidth(toValue: Any, duration: CFTimeInterval) -> CABasicAnimation {
        
        let lineWidthAnimation = CABasicAnimation(keyPath: AnimationKeyPath.lineWidth.rawValue)
        
        lineWidthAnimation.toValue = toValue
        lineWidthAnimation.duration = duration
        lineWidthAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        lineWidthAnimation.autoreverses = true
        lineWidthAnimation.repeatCount = .greatestFiniteMagnitude
        
        return lineWidthAnimation
    }
}

fileprivate enum AnimationKeyPath: String {
    case transformScale = "transform.scale"
    case transformScaleX = "transform.scale.x"
    case transformRotationX = "transform.rotation.x"
    case transformRotationY = "transform.rotation.y"
    case opacity
    case lineWidth
}
