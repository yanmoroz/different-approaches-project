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
    
    func performRequest(_ request: URLRequestable, completion: HTTPServiceResponseCompletion?) {
        session.dataTask(with: request.asURLRequest()) { data, response, error in
            
            let result: Result<Data, Error>
            
            defer {
                DispatchQueue.main.async {
                    completion?(result)
                }
            }
            
            if let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode {
                guard let data = data else {
                    return result = .failure(HTTPRequestError.invalidResponseDataType)
                }
                result = .success(data)
            } else {
                result = .failure(HTTPRequestError.invalidResponse)
            }
        }.resume()
    }
}

extension URLSessionService {
    
    enum HTTPRequestError: Error {
        
        case invalidResponseDataType
        case invalidResponse
        case custom(String)
        
        var localizedDescription: String {
            switch self {
            case .invalidResponseDataType:
                return "Response's data format is different from expected."
            case .invalidResponse:
                return "Invalid response."
            case .custom(let value):
                return value
            }
        }
    }
}
