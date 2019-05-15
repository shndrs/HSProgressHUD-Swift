//
//  SecondViewController.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol HSProgressProtocol {
    func show() -> Void
    func dismiss(completion: (()->Void)?) -> Void
}

public struct HSProgress {
    
    public var strokeColor:UIColor!
    public var mainPulsateColor:UIColor!
    public var secondPulsateColor:UIColor!
    public var title:String!
    public var font:UIFont!
    public var titleTextColor:UIColor!
    public var transViewBackgroundColor:UIColor!
    public var radius:CGFloat!
    public var animationOption:HSAnimationOptions!
    
    public enum HSAnimationOptions {
        case type1, type2, type3
    }
    
    init(strokeColor:UIColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1),
         mainPulsateColor:UIColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1),
         secondPulsateColor:UIColor = UIColor.gray,
         title:String = "Please Wait...",
         font:UIFont = UIFont(name: "AvenirNext-Heavy", size: 19)!,
         titleTextColor:UIColor = .white,
         transViewBackgroundColor:UIColor = UIColor.black.withAlphaComponent(0.65),
         radius:CGFloat = 120,
         animationOption:HSAnimationOptions = .type1) {
        
        self.strokeColor = strokeColor
        self.mainPulsateColor = mainPulsateColor
        self.secondPulsateColor = secondPulsateColor
        self.title = title
        self.font = font
        self.titleTextColor = titleTextColor
        self.transViewBackgroundColor = transViewBackgroundColor
        self.radius = radius
        self.animationOption = animationOption
    }
}


fileprivate enum ShapeLayerType {
    case track, pulsate, innerPulsate
}



open class HSBaseAnimation:UIView, HSProgressProtocol {
    
    
    private var progress: HSProgress
    private lazy var trackShapeLayer = CAShapeLayer()
    private lazy var pulsateShapeLayer = CAShapeLayer()
    private lazy var secondTrackShapeLayer = CAShapeLayer()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = progress.title
        lbl.textAlignment = .center
        lbl.textColor = progress.titleTextColor
        lbl.numberOfLines = 3
        lbl.font = progress.font
        return lbl
    }()
    
    private lazy var transView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.isUserInteractionEnabled = false
        view.backgroundColor = progress.transViewBackgroundColor
        return view
    }()
    
    public init(progress:HSProgress) {
        self.progress = progress
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func show() {
        
    }
    
    func dismiss(completion: (() -> Void)?) {
        
    }
    
    private func layerGenerator(shapeLayer: CAShapeLayer, type: ShapeLayerType) {
        
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
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = 20
        shapeLayer.fillColor = UIColor.clear.cgColor
        transView.layer.addSublayer(shapeLayer)
    }
    
    private func setUI() {
        layerGenerator(shapeLayer: pulsateShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: secondTrackShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: trackShapeLayer, type: .track)
//        setAnimations()
    }
    
    
    
    
}






final class HSAnimationTypeOne:UIView, HSProgressProtocol {
    
    private var progress: HSProgress
    private lazy var trackShapeLayer = CAShapeLayer()
    private lazy var pulsateShapeLayer = CAShapeLayer()
    private lazy var secondTrackShapeLayer = CAShapeLayer()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = progress.title
        lbl.textAlignment = .center
        lbl.textColor = progress.titleTextColor
        lbl.numberOfLines = 3
        lbl.font = progress.font
        return lbl
    }()
    
    private lazy var transView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.isUserInteractionEnabled = false
        view.backgroundColor = progress.transViewBackgroundColor
        return view
    }()
    
    public init(progress:HSProgress) {
        self.progress = progress
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func show() {
        transView.alpha = 0
        titleLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 70)
        titleLabel.center = transView.center
        transView.addSubview(titleLabel)
        setUI()
        UIApplication.shared.keyWindow?.addSubview(transView)
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.transView.alpha = 1
            self.transView.layoutIfNeeded()
        })
    }

    func dismiss(completion: (() -> Void)?) {
        
        self.transView.removeFromSuperview()
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.transView.alpha = 0
            self.transView.layoutIfNeeded()
        }) { (success) in
            
            
            completion?()
        }
    }
    
    private func layerGenerator(shapeLayer: CAShapeLayer, type: ShapeLayerType) {
        
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
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = 20
        shapeLayer.fillColor = UIColor.clear.cgColor
        transView.layer.addSublayer(shapeLayer)
    }
    
    private func setUI() {
        layerGenerator(shapeLayer: pulsateShapeLayer, type: .pulsate)
        layerGenerator(shapeLayer: secondTrackShapeLayer, type: .innerPulsate)
        layerGenerator(shapeLayer: trackShapeLayer, type: .track)
        setAnimations()
    }
    
    fileprivate func setAnimations() {
        
        let transformAnimation = CABasicAnimation(keyPath: "transform.scale")
        let transformAnimationInnerPulsate = CABasicAnimation(keyPath: "transform.scale")
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        let tarnsformXScaleAnimation = CABasicAnimation(keyPath: "transform.scale.x")
        
        transformAnimation.toValue = 1.13
        transformAnimation.duration = 0.8
        transformAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut )
        transformAnimation.autoreverses = true
        transformAnimation.repeatCount = .infinity
        
        transformAnimationInnerPulsate.toValue = 0.95
        transformAnimationInnerPulsate.duration = 1.6
        transformAnimationInnerPulsate.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut )
        transformAnimationInnerPulsate.autoreverses = true
        transformAnimationInnerPulsate.repeatCount = .infinity
        
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.duration = 0.4
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = .infinity
        
        tarnsformXScaleAnimation.fromValue = 1
        tarnsformXScaleAnimation.toValue = 1.02
        tarnsformXScaleAnimation.duration = 1.0
        tarnsformXScaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        tarnsformXScaleAnimation.autoreverses = true
        tarnsformXScaleAnimation.repeatCount = .infinity
        
        pulsateShapeLayer.add(transformAnimation, forKey: "shndrsTransformKey")
        secondTrackShapeLayer.add(transformAnimationInnerPulsate, forKey: "shndrsInnerTransformKey")
        titleLabel.layer.add(opacityAnimation, forKey: "shndrsOpacityKey")
        titleLabel.layer.add(tarnsformXScaleAnimation, forKey: "shndrsXTransKey")
    }
}
    
    
struct HSProgressFactory {
    
    static func getProgress(progress:HSProgress)-> HSProgressProtocol {
        switch progress.animationOption {
            
        case .none:
            print("1")
            return HSAnimationTypeOne(progress: progress)
        case .some(.type1):
            return HSAnimationTypeOne(progress: progress)
        case .some(.type2):
            print("2")
            return HSAnimationTypeOne(progress: progress)
        case .some(.type3):
            print("3")
            return HSAnimationTypeOne(progress: progress)
        }
    }
}
    





final class SecondViewController: UIViewController {
    
    var ab:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let a = HSProgress()
        let show = HSProgressFactory.getProgress(progress: a)
        
        if !ab {
            ab = true
            show.show()
        } else {
            ab = false
            show.dismiss {
                print("shnd")
            }
        }
    }
}

