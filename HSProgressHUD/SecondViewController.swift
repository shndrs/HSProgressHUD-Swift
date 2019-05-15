//
//  SecondViewController.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public protocol HSProgressProtocol {
    func show() -> Void
    func dismiss(completion: (()->Void)?) -> Void
}

public enum ShapeLayerType {
    case track, pulsate, innerPulsate
}

final class SecondViewController: UIViewController {
    
    var ab:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let a = HSProgress()
        
        let show = HSProgressFactory.set(progress: a)
        show.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            show.dismiss(completion: nil)
        }
    }
}

