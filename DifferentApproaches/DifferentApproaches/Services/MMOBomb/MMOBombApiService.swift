//
//  MMOBombApiService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

protocol MMOBombResponseParser {
    
    func parseGetAllGamesReponse(data: Data) -> [Game]
    func parseGetGameByIdReponse(data: Data) -> [Game]
}

class MMOBombApiResponseParser: MMOBombResponseParser {
    
    func parseGetAllGamesReponse(data: Data) -> [Game] {
        return []
    }
    
    func parseGetGameByIdReponse(data: Data) -> [Game] {
        return []
    }
}

//class MMOBombApiService {
//    
//    private let httpService: HTTPService
//    private let responseParser: ResponseParser
//    
//    func getAllGames() {
//        
//    }
//    
//    func getRandomGame() {
//        
//    }
//}
