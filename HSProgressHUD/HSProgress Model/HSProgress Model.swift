//
//  HSProgress Model.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public struct HSProgress {
    
    public var strokeColor: UIColor!
    public var strokeWidth: CGFloat!
    public var mainPulsateColor: UIColor!
    public var secondPulsateColor: UIColor!
    public var title: String!
    public var font: UIFont!
    public var titleTextColor: UIColor!
    public var transViewBackgroundColor: UIColor!
    public var radius: CGFloat!
    public var animationOption: HSAnimationOptions!
    
    public enum HSAnimationOptions {
        case type1, type2, type3, type4
    }
    
    init(strokeColor:UIColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1),
         strokeWidth:CGFloat = 20.0,
         mainPulsateColor:UIColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1),
         secondPulsateColor:UIColor = UIColor.gray,
         title:String = "Please Wait...",
         font:UIFont = UIFont(name: "AvenirNext-Heavy", size: 17)!,
         titleTextColor:UIColor = .white,
         transViewBackgroundColor:UIColor = UIColor.black,
         radius:CGFloat = 105.0,
         animationOption:HSAnimationOptions = .type1) {
        
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
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
