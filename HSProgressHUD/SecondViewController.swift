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
        
        let a = HSProgress(animationOption: .type2)
        
        let show = HSProgressFactory.set(progress: a)
        show.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            show.dismiss(completion: nil)
        }
    }
}

