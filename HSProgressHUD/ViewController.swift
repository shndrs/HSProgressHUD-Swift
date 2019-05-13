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
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please Wait..."
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont(name: "AvenirNext-Heavy", size: 19)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.frame = CGRect(x: 0, y: 0, width: 140, height: 40)
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
        trackShapeLayer.position = view.center
        trackShapeLayer.path = circularTrackPath.cgPath
        trackShapeLayer.lineCap = CAShapeLayerLineCap.round
        trackShapeLayer.strokeColor = UIColor.purple.withAlphaComponent(0.3).cgColor
        trackShapeLayer.lineWidth = 10
        trackShapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackShapeLayer)
        
        let circularPath = UIBezierPath(arcCenter: .zero,
                                        radius: 100,
                                        startAngle: -(.pi) / 2,
                                        endAngle:2 * .pi,
                                        clockwise: true)
        
        shapeLayer.position = view.center
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = UIColor.purple.cgColor
        shapeLayer.lineWidth = 10
        
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    private func beginDownloadingFile() {
        print("download file")
        
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
        
        beginDownloadingFile()
        circleAnimation()
    }
}

