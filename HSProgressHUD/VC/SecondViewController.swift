//
//  SecondViewController.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let progress = HSProgress { (options) in
            options.radius = 120
            options.mainPulsateColor = .brown
            options.strokeWidth = 20
            options.secondPulsateColor = .gray
            options.strokeColor = .orange
            options.animationOption = .lordOfTheRing
            options.font = UIFont(name: "Papyrus", size: 18)!
        }
        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            hud.dismiss(completion: nil)
        }
    }
}
