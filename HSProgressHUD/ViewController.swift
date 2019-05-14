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
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please Wait..."
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.numberOfLines = 2
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
//        (220,20,60)
        let color = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1).cgColor
        
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
        pulsatingLayer.strokeColor = UIColor.purple.withAlphaComponent(0.4).cgColor
        view.layer.addSublayer(pulsatingLayer)
        
        trackShapeLayer.position = view.center
        trackShapeLayer.path = circularTrackPath.cgPath
        trackShapeLayer.lineCap = CAShapeLayerLineCap.round
        trackShapeLayer.strokeColor = UIColor.purple.cgColor
        trackShapeLayer.lineWidth = 20
        trackShapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackShapeLayer)
        
        animatePulsatingLayer()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    private func animatePulsatingLayer() {
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.13
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut )
        animation.autoreverses = true
        animation.repeatCount = .infinity
        pulsatingLayer.add(animation, forKey: "shndrsTransform")
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
        print("SHNDRS")
        
        circleAnimation()
    }
}

