//
//  HSFactory.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import Foundation

public struct HSProgressHUD {
    
    ///This is a Factory Method That return a HSProgressProtocol
    
    public static func set(progress:HSProgress) -> HSProgressProtocol {
        
        switch progress.animationOption {
            
        case .heartBeat:
            
            return HeartBeat(progress: progress)
            
        case .xRotation:
            
            return XRotation(progress: progress)
            
        case .lineLayer:
            
            return LineLayer(progress: progress)
            
        case .lordOfTheRing:
            
            return LordOfTheRing(progress: progress)
            
        }
    }
}
