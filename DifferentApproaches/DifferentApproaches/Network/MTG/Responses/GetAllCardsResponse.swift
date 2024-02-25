//
//  GetAllCardsResponse.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

struct GetAllCardsResponse: Decodable {
    let cards: [Card]
    
    struct Card: Decodable {
        let name: String
        let manaCost: String
        let multiverseid: String?
    }
}
