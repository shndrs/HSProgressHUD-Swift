//
//  HSProgress Model.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

@requires_stored_property_inits
public class HSProgress {
    
    var strokeColor: UIColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
    var strokeWidth: CGFloat = 20.0
    var mainPulsateColor: UIColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
    var secondPulsateColor: UIColor = UIColor.gray
    var title: String = "Please Wait..."
    var font: UIFont = UIFont(name: "AvenirNext-Heavy", size: 17)!
    var titleTextColor: UIColor = .white
    var transViewBackgroundColor: UIColor = UIColor.black
    var radius: CGFloat = 105.0
    var animationOption: HSAnimationOptions = .heartBeat
    
    public enum HSAnimationOptions {
        case heartBeat, xRotation, lineLayer, type4
    }
    
    public typealias BuilderClosure = (HSProgress) -> ()
    
    public init(closure:BuilderClosure) {
        closure(self)
    }
    
}
