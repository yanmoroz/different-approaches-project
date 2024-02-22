//
//  MMOBombEndpoint.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

enum MMOBombEndpoint: URLRequestable {
    
    case getAllGames
    case getGameDetails(Int)
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try URLRequest(url: getUrl())
        urlRequest.httpMethod = getMethod().rawValue
        urlRequest.httpBody = getHttpBody()
        return urlRequest
    }
    
    private func getHttpBody() -> Data? {
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
    
    private func getMethod() -> HTTPMethod {
        switch self {
        case .getAllGames, .getGameDetails:
            return .get
        }
    }
    
    private func getUrl() throws -> URL {
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
    
    private enum Constants {
        static let mmoBombBaseUrl = "https://www.mmobomb.com/api1"
    }
}
