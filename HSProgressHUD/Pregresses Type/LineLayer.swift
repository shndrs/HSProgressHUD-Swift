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
        
        let lineWidthAnimation = HSAnimations.lineWidth(toValue: 20.0, duration: 1.5)
        let secondLineWidthAnimation = HSAnimations.lineWidth(toValue: 18.0, duration: 1)
        let thirdLineWidthAnimation = HSAnimations.lineWidth(toValue: 15.0, duration: 2)
        let opacityAnimation = HSAnimations.opacity()

        mainPulsateShapeLayer.add(opacityAnimation, forKey: "mainPulsateOpacity")
        mainPulsateShapeLayer.add(secondLineWidthAnimation, forKey: "shndrsRotationKey")
        secondPulsateShapeLayer.add(thirdLineWidthAnimation, forKey: "shndrsInnerTransformKey")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
        mainShapeLayer.add(lineWidthAnimation, forKey: "lineWidthAnimation")
    }
}
