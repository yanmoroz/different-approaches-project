//
//  HTTPService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

typealias HTTPServiceResponseCompletion = (Result<Data, Error>) -> Void

protocol HTTPService {
    func performRequest(_ request: URLRequestable, completion: HTTPServiceResponseCompletion?)
}
