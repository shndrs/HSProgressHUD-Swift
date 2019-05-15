//
//  HSFactory.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import Foundation

public struct HSProgressFactory {
    
    static func set(progress:HSProgress) -> HSProgressProtocol {
        
        switch progress.animationOption! {
            
        case .type1:
            
            return TypeOne(progress: progress)
        case .type2:
            
            return TypeTwo(progress: progress)
        case .type3:
            
            return TypeOne(progress: progress)
        }
    }
}

