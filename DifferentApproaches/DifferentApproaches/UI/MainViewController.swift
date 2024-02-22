//
//  MainViewController.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import UIKit

final class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = GamesListAssembly.gamesList()
        let vc2 = GamesListViewController()
        
        viewControllers = [
            vc1, vc2
        ]
    }
}
