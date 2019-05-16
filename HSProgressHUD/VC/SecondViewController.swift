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
        
        let a = HSProgress(animationOption: .lineLayer)
        let progress = HSProgressFactory.set(progress: a)
        progress.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            progress.dismiss(completion: nil)
        }
    }
}

