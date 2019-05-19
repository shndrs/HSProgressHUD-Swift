//
//  CABasicAnimationGenerator.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public class CABasicAnimationGenerator {
    
    public static func transformAnimation(toValue: Any, duration: CFTimeInterval) -> CABasicAnimation {
        
        let transformScaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        transformScaleAnimation.toValue = 1.05
        transformScaleAnimation.duration = 1.0
        transformScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transformScaleAnimation.autoreverses = true
        transformScaleAnimation.repeatCount = .infinity
        
        return transformScaleAnimation
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
