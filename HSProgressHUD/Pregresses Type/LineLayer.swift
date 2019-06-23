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

extension LineLayer: HSProgressAnimation {
    
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
        
        firstShapeLayer.lineWidth = (progress.strokeWidth / 4) + 1
        firstShapeLayer.lineDashPattern = [5]
        firstShapeLayer.strokeStart = 0.0
        firstShapeLayer.strokeEnd = 0.0
        
        let lineDashPhaseAnimation = HSAnimations.lineDashPhase(byValue: 158.0, duration: 3.75, option: .easeInEaseOut, autoreverse: true)
        let lineWidthAnimation = HSAnimations.lineWidth(toValue: (progress.strokeWidth / 4) + 2.5, duration: 0.3)
        let scaleTransformAnimation = HSAnimations.transform(fromValue: 1, toValue: 1.06, duration: 1.1, option: .easeIn)
        let thirdLineWidthAnimation = HSAnimations.lineWidth(toValue: (progress.strokeWidth - 1.0), duration: 0.3)
        let opacityAnimation = HSAnimations.opacity()
        let strokeEndAnimation = HSAnimations.strokeEndAnimation(duration: 2)

        secondShapeLayer.add(scaleTransformAnimation, forKey: HSStrings.hsKey0.rawValue)
        thirdShapeLayer.add(thirdLineWidthAnimation, forKey: HSStrings.hsKey1.rawValue)
        titleLabel.layer.add(opacityAnimation, forKey: HSStrings.hsKey2.rawValue)
        firstShapeLayer.add(lineWidthAnimation, forKey: HSStrings.hsKey3.rawValue)
        firstShapeLayer.add(lineDashPhaseAnimation, forKey: HSStrings.hsKey4.rawValue)
        firstShapeLayer.add(strokeEndAnimation, forKey: HSStrings.hsKey5.rawValue)
    }
}
