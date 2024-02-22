//
//  HTTPService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

protocol HTTPService {
    func performRequest(_ request: URLRequestable) async throws -> Data
}
