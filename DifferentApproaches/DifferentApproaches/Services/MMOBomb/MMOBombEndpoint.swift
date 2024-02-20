//
//  MMOBombEndpoint.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

enum MMOBombEndpoint: URLRequestable {
    
    typealias URLRequestParameters = [String: Any]
    
    case getAllGames
    case getGameDetails(Int)
    
    static let baseUrl = "https://www.mmobomb.com/api1/"
    
    func asURLRequest() -> URLRequest {
        
        var urlRequest = URLRequest(url: getUrl())
        urlRequest.httpMethod = getMethod().rawValue
        urlRequest.httpBody = getHttpBody()
        return urlRequest
    }
    
    private func getHttpBody() -> Data? {
        
        let parameters: URLRequestParameters?
        
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
    
    private func getUrl() -> URL {
        
        let relativePath: String
        var queryItems: [URLQueryItem] = []
        
        switch self {
        case .getAllGames:
            relativePath = "games"
        case .getGameDetails(let id):
            relativePath = "game"
            queryItems.append(URLQueryItem(name: "id", value: "\(id)"))
        }
        
        return URL(string: Self.baseUrl)!
            .appendingPathComponent(relativePath)
            .appending(queryItems: queryItems)
    }
    
    private enum HTTPMethod: String {
        
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        case patch = "PATCH"
        case head = "HEAD"
    }
}
