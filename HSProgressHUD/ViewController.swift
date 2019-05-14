//
//  ViewController.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/13/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    let trackShapeLayer = CAShapeLayer()
    var pulsatingLayer: CAShapeLayer!
    
    let color = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
    let color2 = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please Wait..."
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.numberOfLines = 3
        lbl.font = UIFont(name: "AvenirNext-Heavy", size: 19)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.frame = CGRect(x: 0, y: 0, width: 140, height: 70)
        label.center = view.center
        view.addSubview(label)
        setUI()
    }
    
    private func setUI() {
        
        
        
        let circularTrackPath = UIBezierPath(arcCenter: .zero,
                                             radius: 100,
                                             startAngle: -(.pi) / 2,
                                             endAngle:2 * .pi,
                                             clockwise: true)
        
        pulsatingLayer = CAShapeLayer()
        pulsatingLayer.position = view.center
        pulsatingLayer.path = circularTrackPath.cgPath
        pulsatingLayer.lineCap = CAShapeLayerLineCap.round
        pulsatingLayer.lineWidth = 20
        pulsatingLayer.fillColor = UIColor.clear.cgColor
        pulsatingLayer.strokeColor = color.withAlphaComponent(0.6).cgColor
        view.layer.addSublayer(pulsatingLayer)
        
        animatePulsatingLayer()
        
        trackShapeLayer.position = view.center
        trackShapeLayer.path = circularTrackPath.cgPath
        trackShapeLayer.lineCap = CAShapeLayerLineCap.round
        trackShapeLayer.strokeColor = color.cgColor
        trackShapeLayer.lineWidth = 20
        trackShapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackShapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    private func animatePulsatingLayer() {
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        let animation2 = CABasicAnimation(keyPath: "opacity")
        let animation3 = CABasicAnimation(keyPath: "transform.scale.x")
        
        animation3.fromValue = 1
        animation3.toValue = 1.04
        animation3.duration = 1.0
        animation3.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation3.autoreverses = true
        animation3.repeatCount = .infinity
        
        animation2.fromValue = 0.6
        animation2.toValue = 0.3
        
        animation2.duration = 0.4
        animation2.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animation2.autoreverses = true
        animation2.repeatCount = .infinity
        
        
        animation.toValue = 1.13
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut )
        animation.autoreverses = true
        animation.repeatCount = .infinity
        pulsatingLayer.add(animation, forKey: "shndrsTransform")
        pulsatingLayer.add(animation2, forKey: "shndrsOpacity")
        label.layer.add(animation3, forKey: "shndrsOpacity")
    }
    
    fileprivate func circleAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "shndrs")
    }
    
    @objc private func handleTap() {
        circleAnimation()
    }
}

