//
//  MMOBombEndpoint.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

enum MMOBombEndpoint {
    case getAllGames
    case getGameDetails(Int)
}

// MARK: - URLRequestable
extension MMOBombEndpoint: URLRequestable {
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try URLRequest(url: getUrl())
        urlRequest.httpMethod = getMethod().rawValue
        urlRequest.httpBody = getHttpBody()
        return urlRequest
    }
}

// MARK: - Private Methods
private extension MMOBombEndpoint {
    func getHttpBody() -> Data? {
        let parameters: [String: Any]?
        
        switch self {
        case .getAllGames, .getGameDetails:
            parameters = nil
        }
        
        guard let parameters = parameters else {
            return nil
        }
        
        return try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
    }
    
    func getMethod() -> HTTPMethod {
        switch self {
        case .getAllGames, .getGameDetails:
            return .get
        }
    }
    
    func getUrl() throws -> URL {
        let relativePath: String
        var queryItems: [URLQueryItem] = []
        
        switch self {
        case .getAllGames:
            relativePath = "/games"
        case .getGameDetails(let id):
            relativePath = "/game"
            queryItems.append(URLQueryItem(name: "id", value: "\(id)"))
        }
        
        guard let baseUrl = URL(string: Constants.mmoBombBaseUrl) else {
            throw NetworkError.badBaseUrl
        }
        
        return baseUrl.appendingPathComponent(relativePath)
            .appending(queryItems: queryItems)
    }
    
    enum Constants {
        static let mmoBombBaseUrl = "https://www.mmobomb.com/api1"
    }
}
