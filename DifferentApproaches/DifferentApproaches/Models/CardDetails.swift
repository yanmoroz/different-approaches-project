//
//  CardDetails.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import Foundation

struct CardDetails: Identifiable {
    let id = UUID()
    let name: String
    let manaCost: String
}

// MARK: - Casting Inits
extension CardDetails {
    init(response: GetCardByIdResponse.Card) {
        name = response.name
        manaCost = response.manaCost
    }
}
