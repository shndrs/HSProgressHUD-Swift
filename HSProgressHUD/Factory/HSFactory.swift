//
//  HSFactory.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import Foundation

public struct HSProgressHUD {
    
    private init() {}
    
    ///A Factory method That returns a HSProgressProtocol to access show() and dismiss() functions
    
    @discardableResult
    public static func set(progress:HSProgressOptions) -> HSProgress {
        
        switch progress.animationOption {
            
        case .heartBeat:
            
            return HeartBeat(progress: progress)
            
        case .xRotation:
            
            return XRotation(progress: progress)
            
        case .lineLayer:
            
            return LineLayer(progress: progress)
            
        case .lordOfTheRings:
            
            return LordOfTheRings(progress: progress)
            
        case .xyRotation:
            
            return XYRotation(progress:progress)
            
        case .yRotation:
            
            return YRotation(progress:progress)
        }
    }
}
