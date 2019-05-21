//
//  LineLayer.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class LineLayer: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension LineLayer: HSProgress {
    
    public func show() {
        
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
        transView.alpha = 0
        titleLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 70)
        titleLabel.center = transView.center
        transView.addSubview(titleLabel)
        layerGenerator(shapeLayer: secondShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: thirdShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: firstShapeLayer, type: .track)
        setAnimation()
    }
    
    public func setAnimation() {
        
        firstShapeLayer.lineWidth = 5.0
        
        let lineWidthAnimation = HSAnimations.lineWidth(toValue: 20.0, duration: 1.5)
        let secondLineWidthAnimation = HSAnimations.lineWidth(toValue: 18.0, duration: 1)
        let thirdLineWidthAnimation = HSAnimations.lineWidth(toValue: 15.0, duration: 2)
        let opacityAnimation = HSAnimations.opacity()

        secondShapeLayer.add(opacityAnimation, forKey: HSHUDStrings.hsKey0.rawValue)
        secondShapeLayer.add(secondLineWidthAnimation, forKey: HSHUDStrings.hsKey1.rawValue)
        thirdShapeLayer.add(thirdLineWidthAnimation, forKey: HSHUDStrings.hsKey2.rawValue)
        titleLabel.layer.add(opacityAnimation, forKey: HSHUDStrings.hsKey3.rawValue)
        firstShapeLayer.add(lineWidthAnimation, forKey: HSHUDStrings.hsKey4.rawValue)
    }
}
