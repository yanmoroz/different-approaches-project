//
//  MTGEndpoint.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

enum MTGEndpoint: URLRequestable {

    case getAllCards
    case getCardDetails(Int)
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try URLRequest(url: getUrl())
        urlRequest.httpMethod = getMethod().rawValue
        urlRequest.httpBody = getHttpBody()
        return urlRequest
    }
    
    private func getHttpBody() -> Data? {
        let parameters: [String: Any]?
        
        switch self {
        case .getAllCards, .getCardDetails:
            parameters = nil
        }
        
        guard let parameters = parameters else {
            return nil
        }
        
        return try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
    }
    
    private func getMethod() -> HTTPMethod {
        switch self {
        case .getAllCards, .getCardDetails:
            return .get
        }
    }
    
    private func getUrl() throws -> URL {
        let relativePath: String
        
        switch self {
        case .getAllCards:
            relativePath = "/cards"
        case .getCardDetails(let id):
            relativePath = "/cards/\(id)"
        }
        
        guard let baseUrl = URL(string: Constants.magicTheGatheringBaseUrl) else {
            throw NetworkError.badBaseUrl
        }
        
        return baseUrl.appendingPathComponent(relativePath)
    }
    
    private enum Constants {
        static let magicTheGatheringBaseUrl = "https://api.magicthegathering.io/v1"
    }
}
