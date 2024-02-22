//
//  AppDelegate.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import UIKit
import OSLog

extension Error {
    func log() {
        Logger().error("\(self.localizedDescription)")
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Task {
            do {
                let games = try await MMOBombApiServiceImpl().getAllGames()
                print(games.count)
            } catch {
                error.log()
            }
        }
        
        Task {
            do {
                let game = try await MMOBombApiServiceImpl().getGameById(456)
                print(game.title)
            } catch {
                error.log()
            }
        }
        
        Task {
            do {
                let cards = try await MTGApiServiceImpl().getAllCards()
                print(cards.count)
            } catch {
                error.log()
            }
        }
        
        Task {
            do {
                let card = try await MTGApiServiceImpl().getCardById(129711)
                print(card.name)
            } catch {
                error.log()
            }
        }
        
        return true
    }
}

