//
//  URLSessionService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

class URLSessionService: HTTPService {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func performRequest(_ request: URLRequestable) async throws -> Result<Data, Error> {
        let (data, response) = try await session.data(for: request.asURLRequest())
        if let response = response as? HTTPURLResponse, !(200..<300).contains(response.statusCode) {
            return .failure(HTTPRequestError.status(response.statusCode))
        }
        return .success(data)
    }
}

extension URLSessionService {
    
    enum HTTPRequestError: Error {
        case status(Int)
    }
}
