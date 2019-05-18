//
//  HSFactory.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import Foundation

public struct HSProgressFactory {
    
    public static func set(progress:HSProgress) -> HSProgressProtocol {
        
        switch progress.animationOption! {
            
        case .heartBeat:
            
            return TypeOne(progress: progress)
        case .xRotation:
            
            return TypeTwo(progress: progress)
        case .lineLayer:
            
            return TypeThree(progress: progress)
        case .type4:
            
            return TypeFour(progress: progress)
        }
    }
}

