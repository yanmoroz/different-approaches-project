//
//  Card.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

struct Card: Identifiable {
    let id: String
    let name: String
    let manaCost: String
}

// MARK: - Casting Inits
extension Card {
    init(response: GetAllCardsResponse.Card) throws {
        guard let multiverseId = response.multiverseid else {
            throw CastError.missingId
        }
        
        id = multiverseId
        name = response.name
        manaCost = response.manaCost
    }
}
