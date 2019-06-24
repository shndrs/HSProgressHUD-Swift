//
//  HNK.swift
//  HSProgressHUD
//
//  Created by NP2 on 6/23/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class HNK: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension HNK: HSProgress {
    
    public func show() {
        
        setLayers()
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = false
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
            UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
            completion?()
        }
    }
}

// MARK: Set Animation And Layers

extension HNK: HSProgressAnimation {
    
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
        
        firstShapeLayer.lineWidth = progress.strokeWidth
        firstShapeLayer.lineDashPattern = [5]
        
        secondShapeLayer.lineWidth = progress.strokeWidth
        secondShapeLayer.lineDashPattern = [5]
        
        thirdShapeLayer.lineWidth = progress.strokeWidth
        thirdShapeLayer.lineDashPattern = [5]
        
        firstShapeLayer.strokeStart = 0.0
        firstShapeLayer.strokeEnd = 0.0
        
        let rotationYAnimation = HSAnimations.rotationY(duration: 6)
        let transformScaleAnimation = HSAnimations.transform(toValue: 0.96, duration: 2.0, option: .easeInEaseOut)
        let transformScaleAnimation3 = HSAnimations.transform(fromValue: 1.04, toValue: 1.09, duration: 3, option: .easeInEaseOut)
        let opacityAnimation = HSAnimations.opacity()
        let lineDashPhaseAnimation = HSAnimations.lineDashPhase(byValue: 18.0, duration: 0.75)
        let strokeEndAnimation = HSAnimations.strokeEndAnimation(toValue: 1, duration: 0.4, option: .easeIn)
        
        firstShapeLayer.add(transformScaleAnimation, forKey: HSStrings.hsKey0.rawValue)
        secondShapeLayer.add(rotationYAnimation, forKey: HSStrings.hsKey1.rawValue)
        thirdShapeLayer.add(transformScaleAnimation3, forKey: HSStrings.hsKey2.rawValue)
        titleLabel.layer.add(opacityAnimation, forKey: HSStrings.hsKey3.rawValue)
        firstShapeLayer.add(lineDashPhaseAnimation, forKey: HSStrings.hsKey4.rawValue)
        secondShapeLayer.add(lineDashPhaseAnimation, forKey: HSStrings.hsKey5.rawValue)
        thirdShapeLayer.add(lineDashPhaseAnimation, forKey: HSStrings.hsKey6.rawValue)
        firstShapeLayer.add(strokeEndAnimation, forKey: HSStrings.hsKey7.rawValue)
    }
}

