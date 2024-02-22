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
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .green
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .red
        
        viewControllers = [
            vc1, vc2
        ]
    }
}
