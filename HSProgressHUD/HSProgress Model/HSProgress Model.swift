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
    
    public var strokeColor: UIColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
    public var strokeWidth: CGFloat = 20.0
    public var mainPulsateColor: UIColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
    public var secondPulsateColor: UIColor = UIColor.gray
    public var title: String = "Please Wait..."
    public var font: UIFont = UIFont(name: "AvenirNext-Heavy", size: 17)!
    public var titleTextColor: UIColor = .white
    public var transViewBackgroundColor: UIColor = UIColor.black
    public var radius: CGFloat = 105.0
    public var animationOption: HSAnimationOptions = .heartBeat
    
    public typealias BuilderClosure = (HSProgress) -> ()
    
    public required init() {}
    
    public init(closure:BuilderClosure) {
        closure(self)
    }
}
