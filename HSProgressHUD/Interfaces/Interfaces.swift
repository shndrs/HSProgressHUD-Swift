//
//  Interfaces.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import Foundation

public protocol HSProgressAnimation {
    func setAnimation() -> Void
    func setLayers() -> Void
}

public protocol HSProgress {
    func show() -> Void
    func dismiss(completion: (()->Void)?) -> Void
}
