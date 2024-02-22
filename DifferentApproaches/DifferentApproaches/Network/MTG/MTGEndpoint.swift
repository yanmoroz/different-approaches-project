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
    
    static let baseUrl = Constants.magicTheGatheringBaseUrl
    
    func asURLRequest() -> URLRequest {
        var urlRequest = URLRequest(url: getUrl())
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
    
    private func getUrl() -> URL {
        let relativePath: String
        
        switch self {
        case .getAllCards:
            relativePath = "/cards"
        case .getCardDetails(let id):
            relativePath = "/cards/\(id)"
        }
        
        return URL(string: Self.baseUrl)!
            .appendingPathComponent(relativePath)
    }
}
