//
//  HSProgress Model.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public enum HSAnimationOptions {
    case heartBeat, xRotation, lineLayer, lordOfTheRing
}

@requires_stored_property_inits public class HSProgress {
    
    /// the color of main circle (by default is UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1))
    public var strokeColor: UIColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
    
    /// the width of stroke (by default is 17.0)
    public var strokeWidth: CGFloat = 17.0
    
    /// the color of mian pulsate layer that is transparent all the time (by default is UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1))
    public var mainPulsateColor: UIColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
    
    /// the color of inner pulsate layer (by default is .gray)
    public var secondPulsateColor: UIColor = UIColor.gray
    
    /// title text (by default is Please Wait...)
    public var title: String = "Please Wait..."
    
    /// font of title text (by default is AvenirNext-Heavy size 17)
    public var font: UIFont = UIFont(name: "AvenirNext-Heavy", size: 17)!
    
    /// color of title text (by default is white)
    public var titleTextColor: UIColor = .white
    
    /// the background transparent view color (by default is black)
    public var transViewBackgroundColor: UIColor = UIColor.black
    
    /// the radius of the circles (by default is 105.0)
    public var radius: CGFloat = 105.0
    
    /// choose diffrent kind of animations by changing this property (by default is HSAnimationOptions.heartBeat)
    public var animationOption: HSAnimationOptions = .heartBeat
    
    
    
    public typealias BuilderClosure = (HSProgress) -> ()
    
    /// use this initializer for default setup
    public required init() {}
    
    /// Customize HSProgressHUD using this closure
    public init(closure:BuilderClosure) {
        closure(self)
    }
}
