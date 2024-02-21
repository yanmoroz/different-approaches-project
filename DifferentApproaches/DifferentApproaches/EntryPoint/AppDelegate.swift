//
//  AppDelegate.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        Task {
//            do {
//                let games = try await MMOBombApiService().getAllGames()
//                print(games)
//            } catch {
//                print(error)
//            }
//        }
        
        Task {
            do {
                let games = try await MMOBombApiService().getGameById(456)
                print(games)
            } catch {
                print(error)
            }
        }
        
        return true
    }
}

