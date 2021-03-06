//
//  AntColony.swift
//  HSProgressHUD
//
//  Created by NP2 on 6/23/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class AntColony: HSBaseView {}

// MARK: HSProgressProtocol Impelementation

extension AntColony: HSProgress {
    
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
        }) { _ in
            
            self.transView.removeFromSuperview()
            UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
            completion?()
        }
    }
}

// MARK: Set Animation And Layers

extension AntColony: HSProgressAnimation {
    
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
        
        firstShapeLayer.lineWidth = 5.0
        firstShapeLayer.lineDashPattern = [5]
        
        let lineDashPhaseAnimation = HSAnimations.lineDashPhase(byValue: 10.0, duration: 0.75, option: .linear, autoreverse: false)
        let scaleTransformAnimation = HSAnimations.transform(fromValue: 1.14, toValue: 0.93, duration: 2, option: .linear)
        let thirdLineWidthAnimation = HSAnimations.lineWidth(toValue: (progress.strokeWidth - 3.5), duration: 2)
        let opacityAnimation = HSAnimations.opacity()
        let transformXAnimation = HSAnimations.transformX()
        
        secondShapeLayer.add(scaleTransformAnimation, forKey: HSStrings.hsKey1.rawValue)
        thirdShapeLayer.add(thirdLineWidthAnimation, forKey: HSStrings.hsKey2.rawValue)
        titleLabel.layer.add(opacityAnimation, forKey: HSStrings.hsKey3.rawValue)
        titleLabel.layer.add(transformXAnimation, forKey: HSStrings.hsKey0.rawValue)
        firstShapeLayer.add(lineDashPhaseAnimation, forKey: HSStrings.hsKey4.rawValue)
    }
}
