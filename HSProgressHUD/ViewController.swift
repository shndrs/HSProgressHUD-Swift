//
//  ViewController.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/13/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let shapeLayer = CAShapeLayer()
        
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle:2 * .pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.purple.cgColor
        shapeLayer.lineWidth = 10
        
        view.layer.addSublayer(shapeLayer)
        
        
        
    }


}

