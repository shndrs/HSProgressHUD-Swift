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
    
    public static func transform(toValue: Any, duration: CFTimeInterval, option:CAMediaTimingFunctionName) -> CABasicAnimation {
        
        let transformScaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        transformScaleAnimation.toValue = toValue
        transformScaleAnimation.duration = duration
        transformScaleAnimation.timingFunction = CAMediaTimingFunction(name: option)
        transformScaleAnimation.autoreverses = true
        transformScaleAnimation.repeatCount = .infinity
        
        return transformScaleAnimation
    }
    
    public static func transform(fromValue:Any, toValue: Any, duration: CFTimeInterval, option:CAMediaTimingFunctionName) -> CABasicAnimation {
        
        let transformScaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        transformScaleAnimation.fromValue = fromValue
        transformScaleAnimation.toValue = toValue
        transformScaleAnimation.duration = duration
        transformScaleAnimation.timingFunction = CAMediaTimingFunction(name: option)
        transformScaleAnimation.autoreverses = true
        transformScaleAnimation.repeatCount = .infinity
        
        return transformScaleAnimation
    }
    
    public static func transformX() -> CABasicAnimation {
        
        let transformXScaleAnimation = CABasicAnimation(keyPath: "transform.scale.x")
        
        transformXScaleAnimation.fromValue = 1
        transformXScaleAnimation.toValue = 1.02
        transformXScaleAnimation.duration = 1.0
        transformXScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transformXScaleAnimation.autoreverses = true
        transformXScaleAnimation.repeatCount = .infinity
        
        return transformXScaleAnimation
    }
    
    public static func rotationX(duration: CFTimeInterval) -> CABasicAnimation {
        
        let rotationXAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        
        rotationXAnimation.fromValue = 0
        rotationXAnimation.toValue = CGFloat.pi * 2
        rotationXAnimation.duration = duration
        rotationXAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        rotationXAnimation.autoreverses = true
        rotationXAnimation.repeatCount = .infinity
        
        return rotationXAnimation
    }
    
    public static func rotationY(duration: CFTimeInterval) -> CABasicAnimation {
        
        let rotationXAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        
        rotationXAnimation.fromValue = 0
        rotationXAnimation.toValue = CGFloat.pi * 2
        rotationXAnimation.duration = duration
        rotationXAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        rotationXAnimation.autoreverses = true
        rotationXAnimation.repeatCount = .infinity
        
        return rotationXAnimation
    }
    
    public static func opacity() -> CABasicAnimation {
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.duration = 0.4
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = .infinity
        
        return opacityAnimation
    }
}

