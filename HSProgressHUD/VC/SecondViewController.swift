//
//  SecondViewController.swift
//  HSProgressHUD
//
//  Created by NP2 on 5/15/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
    
    // MARK: - HeartBeat HUD
    
    @IBAction private func heartBeatButtonPressed(_ sender: UIButton) {
        
        let progress = HSProgressOptions { (options) in
            options.radius = 100
            options.secondLayerStrokeColor = CustomColors.niceBlue
            options.strokeWidth = 13
            options.thirdLayerStrokeColor = .brown
            options.firstLayerStrokeColor = .gray
            options.title = "shndrs presents"
            options.animationOption = HSAnimationOptions.heartBeat
        }
        
        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            hud.dismiss(completion: nil)
        }
    }
    
    // MARK: - LineLayer HUD

    @IBAction private func lineLayerButtonPressed(_ sender: UIButton) {
        
        let progress = HSProgressOptions { (options) in
            options.radius = 100
            options.secondLayerStrokeColor = CustomColors.niceBlue
            options.strokeWidth = 13
            options.thirdLayerStrokeColor = .gray
            options.firstLayerStrokeColor = .black
            options.title = "shndrs presents"
            options.animationOption = HSAnimationOptions.lineLayer
        }
        
        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            hud.dismiss(completion: nil)
        }
    }
    
    // MARK: - LordOfTheRings HUD
    
    @IBAction private func lordOfTheRingsButtonPressed(_ sender: UIButton) {
        
        let progress = HSProgressOptions { (options) in
            options.radius = 100
            options.secondLayerStrokeColor = CustomColors.greenButton
            options.strokeWidth = 12
            options.thirdLayerStrokeColor = .darkGray
            options.firstLayerStrokeColor = CustomColors.niceBlue
            options.title = "shndrs presents"
            options.animationOption = HSAnimationOptions.lordOfTheRings
        }
        
        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            hud.dismiss(completion: nil)
        }
    }
    
    // MARK: - XRotation HUD
    
    @IBAction private func xRotationButtonPressed(_ sender: UIButton) {
        
        let progress = HSProgressOptions { (options) in
            options.radius = 100
            options.secondLayerStrokeColor = .brown
            options.strokeWidth = 12
            options.thirdLayerStrokeColor = .gray
            options.firstLayerStrokeColor = .darkGray
            options.title = "shndrs presents"
            options.animationOption = HSAnimationOptions.xRotation
        }
        
        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            hud.dismiss(completion: nil)
        }
    }
    
    // MARK: - YRotation HUD

    @IBAction private func yRotationButtonPressed(_ sender: UIButton) {
        
        let progress = HSProgressOptions { (options) in
            options.radius = 100
            options.secondLayerStrokeColor = .brown
            options.strokeWidth = 12
            options.thirdLayerStrokeColor = .gray
            options.firstLayerStrokeColor = .darkGray
            options.title = "shndrs presents"
            options.animationOption = HSAnimationOptions.yRotation
        }
        
        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            hud.dismiss(completion: nil)
        }
    }
    
    // MARK: - XYRotation HUD
    
    @IBAction private func xyRotationButtonPressed(_ sender: UIButton) {
        
        let progress = HSProgressOptions { (options) in
            options.radius = 100
            options.secondLayerStrokeColor = CustomColors.greenButton
            options.strokeWidth = 12
            options.thirdLayerStrokeColor = .darkGray
            options.firstLayerStrokeColor = CustomColors.niceBlue
            options.title = "shndrs presents"
            options.animationOption = HSAnimationOptions.xyRotation
        }
        
        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            hud.dismiss(completion: nil)
        }
    }
    
    // MARK: - AntColony HUD
    
    @IBAction private func antColonyButtonPressed(_ sender: UIButton) {
        
        let progress = HSProgressOptions { (options) in
            options.radius = 120
            options.secondLayerStrokeColor = CustomColors.white
            options.strokeWidth = 12
            options.thirdLayerStrokeColor = .darkGray
            options.firstLayerStrokeColor = CustomColors.windowsBlue
            options.title = "shndrs presents"
            options.animationOption = HSAnimationOptions.antColony
        }
        
        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            hud.dismiss(completion: nil)
        }
    }
    
    //MARK: - HNK HUD
    
    @IBAction private func hnkButtonPressed(_ sender: UIButton) {
        
        let progress = HSProgressOptions { (options) in
            options.radius = 115
            options.secondLayerStrokeColor = CustomColors.niceBlue
            options.strokeWidth = 3
            options.thirdLayerStrokeColor = .gray
            options.firstLayerStrokeColor = CustomColors.niceBlue
            options.title = "shndrs presents"
            options.animationOption = HSAnimationOptions.hnk
        }
        
        let hud = HSProgressHUD.set(progress: progress)
        hud.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            hud.dismiss(completion: nil)
        }
    }
}

// MARK: - Life Cycle

extension SecondViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "HSProgressHUD"
        navigationController?.navigationBar.barTintColor = .white
    }
}
