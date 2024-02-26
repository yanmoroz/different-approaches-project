//
//  URLSessionService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

final class URLSessionService {
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
}

// MARK: - HTTPService
extension URLSessionService: HTTPService {
    func performRequest(_ request: URLRequestable) async throws -> Data {
        let (data, response) = try await session.data(for: request.asURLRequest())
        if let response = response as? HTTPURLResponse, !(200..<300).contains(response.statusCode) {
            throw NetworkError.badStatus(response.statusCode)
        }
        return data
    }
}
