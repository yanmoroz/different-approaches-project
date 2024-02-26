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
    let imageUrl: URL
    let text: String
}

// MARK: - Casting Inits
extension CardDetails {
    init(response: GetCardByIdResponse.Card) {
        name = response.name
        manaCost = response.manaCost
        text = response.text
        
        if response.imageUrl.absoluteURL.scheme == "http" {
            var components = URLComponents(string: response.imageUrl.absoluteString)
            components?.scheme = "https"
            imageUrl = components!.url!
        } else {
            imageUrl = response.imageUrl
        }
    }
}
