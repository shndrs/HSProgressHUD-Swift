//
//  SecondViewController.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
    
    @IBAction private func heartBeatButtonPressed(_ sender: UIButton) {
        
        let progress = HSProgressOptions { (options) in
            options.radius = 100
            options.secondLayerStrokeColor = .brown
            options.strokeWidth = 17
            options.thirdLayerStrokeColor = .gray
            options.firstLayerStrokeColor = .darkGray
            options.title = "shndrs presents"
            
            
            options.animationOption = HSAnimationOptions.heartBeat
        }
        
        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            hud.dismiss(completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }
}
