//
//  SecondViewController.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let progress = HSProgressOptions { (options) in
            options.radius = 100
            options.mainPulsateColor = .brown
            options.strokeWidth = 17
            options.secondPulsateColor = .gray
            options.strokeColor = .darkGray
            options.title = "shndrs presents"
            options.animationOption = HSAnimationOptions.heartBeat
        }

        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            hud.dismiss(completion: nil)
        }
    }
}
