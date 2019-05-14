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
    func shapeLayerGenerator() -> Void
}

public class HSView: UIView {
    
    public static let `default` = HSView()
    
    private convenience init() {
        self.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var trackShapeLayer = CAShapeLayer()
    private lazy var pulsateShapeLayer = CAShapeLayer()
    private lazy var circularTrackPath = UIBezierPath(arcCenter: .zero,
                                                      radius: 100,
                                                      startAngle: -(.pi) / 2,
                                                      endAngle:2 * .pi,
                                                      clockwise: true)
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please Wait..."
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.numberOfLines = 3
        lbl.font = UIFont(name: "AvenirNext-Heavy", size: 19)
        return lbl
    }()
    
    private lazy var transView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.isUserInteractionEnabled = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.65)
        return view
    }()
    
    

    
    private func layerGenerator(shapeLayer: CAShapeLayer) {
        
        shapeLayer.position = transView.center
        shapeLayer.path = circularTrackPath.cgPath
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = 20
        shapeLayer.fillColor = UIColor.clear.cgColor
        transView.layer.addSublayer(trackShapeLayer)
    }

}

// MARK: Life Cycle

extension HSView {
    
    public override func awakeFromNib() {
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 70)
        titleLabel.center = transView.center
        transView.addSubview(titleLabel)
        setUI()
    }
    
    
}

// MARK: Show and Dismiss HSProgressHUD

extension HSView {
    
    /// Show HSProgressHUD with fadeIn animation
    
    public func show() {
        
        transView.alpha = 0
        transView.bringSubviewToFront(<#T##view: UIView##UIView#>)
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
        })
        
        transView.alpha = 0
    }
}

// MARK: Set UI

extension HSView {
    
    private func setUI() {
        
    }
    
    
}

// MARK: Customization

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
}
