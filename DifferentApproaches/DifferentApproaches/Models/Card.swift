//
//  Card.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

struct Card {
    let name: String
    let manaCost: String
}

extension Card {
    
    init(response: GetAllCardsResponse.Card) {
        name = response.name
        manaCost = response.manaCost
    }
    
    init(response: GetCardByIdResponse.Card) {
        name = response.name
        manaCost = response.manaCost
    }
}
