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
        
//        URLSessionService().performRequest(MMOBombEndpoint.getAllGames) { result in
//            switch result {
//            case .success(let data):
//                let parser = MMOBombResponseParserImpl()
//                let foo = try! parser.parseGetAllGamesReponse(data: data)
//                print(foo)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        URLSessionService().performRequest(MMOBombEndpoint.getGameDetails(405)) { result in
//            switch result {
//            case .success(let data):
//                let parser = MMOBombResponseParserImpl()
//                let foo = try! parser.parseGetGameByIdReponse(data: data)
//                print(foo)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        return true
    }
}

