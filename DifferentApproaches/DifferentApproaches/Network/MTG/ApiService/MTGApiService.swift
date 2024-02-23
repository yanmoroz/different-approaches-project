//
//  MTGApiService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import Foundation

protocol MTGApiService {
    func getAllCards() async throws -> [Card]
    func getCardById(_ id: Int) async throws -> Card
}
