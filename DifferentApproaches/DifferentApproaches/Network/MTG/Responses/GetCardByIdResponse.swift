//
//  GetCardByIdResponse.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

struct GetCardByIdResponse: Decodable {
    
    let card: Card
    
    struct Card: Decodable {
        let name: String
        let manaCost: String
    }
}
