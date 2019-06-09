//
//  HSBaseView.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public enum ShapeLayerType {
    case track, pulsate, innerPulsate
}

open class HSBaseView: UIView {
    
    private var progress: HSProgressOptions
    /// our first shape layer
    public private(set) lazy var firstShapeLayer = CAShapeLayer()
    /// our second shape layer
    public private(set) lazy var secondShapeLayer = CAShapeLayer()
    /// our third shape layer
    public private(set) lazy var thirdShapeLayer = CAShapeLayer()
    
    /// the title label
    public private(set) lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = progress.title
        lbl.textAlignment = .center
        lbl.textColor = progress.titleTextColor
        lbl.numberOfLines = 3
        lbl.font = progress.font
        return lbl
    }()
    
    /// the transparent view in the background
    public private(set) lazy var transView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.isUserInteractionEnabled = false
        view.backgroundColor = progress.transViewBackgroundColor.withAlphaComponent(0.60)
        return view
    }()
    /// HSBaseView initializer that take a HSProgressOptions as it input
    public init(progress: HSProgressOptions) {
        self.progress = progress
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// this method set the circles position, path, fillColor and.........
    public func layerGenerator(shapeLayer: CAShapeLayer, type: ShapeLayerType) {
        
        switch type {
            
        case .track:
            shapeLayer.strokeColor = progress.strokeColor.cgColor
        case .pulsate:
            shapeLayer.strokeColor = progress.mainPulsateColor.withAlphaComponent(0.34).cgColor
        case .innerPulsate:
            shapeLayer.strokeColor = progress.secondPulsateColor.cgColor
        }
        
        let circularTrackPath = UIBezierPath(arcCenter: .zero,
                                             radius: progress.radius,
                                             startAngle: -(.pi) / 2, endAngle:2 * .pi,
                                             clockwise: true)
        
        shapeLayer.position = transView.center
        shapeLayer.path = circularTrackPath.cgPath
        shapeLayer.lineWidth = progress.strokeWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        transView.layer.addSublayer(shapeLayer)
    }
}
