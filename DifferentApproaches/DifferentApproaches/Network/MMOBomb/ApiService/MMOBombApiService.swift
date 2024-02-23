//
//  MMOBombApiService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import Foundation

protocol MMOBombApiService {
    func getAllGames() async throws -> [Game]
    func getGameById(_ id: Int) async throws -> GameDetails
}
