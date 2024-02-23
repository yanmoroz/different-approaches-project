//
//  MMOBombResponseParser.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import Foundation

protocol MMOBombResponseParser {
    func parseGetAllGamesResponse(data: Data) throws -> [Game]
    func parseGetGameByIdResponse(data: Data) throws -> GameDetails
}
