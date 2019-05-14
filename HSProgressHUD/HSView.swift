//
//  HSView.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/14/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

fileprivate protocol HSViewHUD {
    func dismiss() -> Void
    func show() -> Void
}

fileprivate enum ShapeLayerType {
    case track, pulsate
}

public class HSView: UIView {
    
    public static let `default` = HSView()
    
    private let pleaseWait = "Please Wait..."
    private let fontName = "AvenirNext-Heavy"
    private var trackLayerColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
    private var pulsateLayerColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
    private lazy var trackShapeLayer = CAShapeLayer()
    private lazy var pulsateShapeLayer = CAShapeLayer()
    private lazy var circularTrackPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: -(.pi) / 2, endAngle:2 * .pi, clockwise: true)
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = pleaseWait
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.numberOfLines = 3
        lbl.font = UIFont(name: fontName, size: 19)
        return lbl
    }()
    
    private lazy var transView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.isUserInteractionEnabled = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.65)
        return view
    }()
    
    private convenience init() {
        self.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layerGenerator(shapeLayer: CAShapeLayer, type: ShapeLayerType) {
        
        switch type {
        
        case .track:
            shapeLayer.strokeColor = trackLayerColor.cgColor
        case .pulsate:
            shapeLayer.strokeColor = pulsateLayerColor.withAlphaComponent(0.34).cgColor
        }
        
        shapeLayer.position = transView.center
        shapeLayer.path = circularTrackPath.cgPath
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = 20
        shapeLayer.fillColor = UIColor.clear.cgColor
        transView.layer.addSublayer(shapeLayer)
    }

}

// MARK: - Life Cycle

extension HSView {
    
    public override func awakeFromNib() {
        titleLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 70)
        titleLabel.center = transView.center
        transView.addSubview(titleLabel)
        setUI()
    }
}

// MARK: - Show and Dismiss HSProgressHUD

extension HSView: HSViewHUD {
    
    /// Show HSProgressHUD with fadeIn animation
    
    public func show() {
        
        transView.alpha = 0
//        transView.bringSubviewToFront(T##view: UIView##UIView)
        UIApplication.shared.keyWindow?.addSubview(transView)
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.transView.alpha = 1
            self.transView.layoutIfNeeded()
        })
    }
    
    /// Dismiss HSProgressHUD with fadeOut animation
    
    public func dismiss() {
        
        transView.alpha = 1
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.alpha = 0
            self.transView.layoutIfNeeded()
        }) { (success) in
            self.transView.removeFromSuperview()
        }
    }
}

// MARK: - Set UI

extension HSView {
    
    private func setUI() {
        layerGenerator(shapeLayer: pulsateShapeLayer, type: .pulsate)
        setAnimations()
        layerGenerator(shapeLayer: trackShapeLayer, type: .track)
    }
}

// MARK: - Customization

public extension HSView {
    
    /// Title text
    
    public func set(text:String) {
        titleLabel.text = text
    }
    
    public func set(font:UIFont) {
        titleLabel.font = font
    }
    
    /// The Color of the title text
    
    public func set(textColor:UIColor) {
        titleLabel.textColor = textColor
    }
    
    /// The color of background transparent view
    
    public func set(transViewColor:UIColor) {
        transView.backgroundColor = transViewColor
    }
    
    /// The Radius of main circle
    
    public func set(radius:CGFloat) {
        circularTrackPath = UIBezierPath(arcCenter: .zero,
                                         radius: radius,
                                         startAngle: -(.pi) / 2,
                                         endAngle:2 * .pi,
                                         clockwise: true)
    }
    
    /// The Color of our Layers
    
    public func set(trackColor:UIColor, pulsateColor:UIColor) {
        trackLayerColor = trackColor
        pulsateLayerColor = pulsateColor
    }
}

// MARK: - Animations

extension HSView {
    
    fileprivate func setAnimations() {
        
        let transformAnimation = CABasicAnimation(keyPath: "transform.scale")
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        let tarnsformXScaleAnimation = CABasicAnimation(keyPath: "transform.scale.x")
        
        tarnsformXScaleAnimation.fromValue = 1
        tarnsformXScaleAnimation.toValue = 1.02
        tarnsformXScaleAnimation.duration = 1.0
        tarnsformXScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        tarnsformXScaleAnimation.autoreverses = true
        tarnsformXScaleAnimation.repeatCount = .infinity
        
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.duration = 0.4
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = .infinity
        
        transformAnimation.toValue = 1.13
        transformAnimation.duration = 0.8
        transformAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut )
        transformAnimation.autoreverses = true
        transformAnimation.repeatCount = .infinity
        
        pulsateShapeLayer.add(transformAnimation, forKey: "shndrsTransformKey")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
        titleLabel.layer.add(tarnsformXScaleAnimation, forKey: "shndrsXTransKey")
    }
  
}
