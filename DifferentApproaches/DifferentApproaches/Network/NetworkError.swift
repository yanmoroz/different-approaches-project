//
//  NetworkError.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

enum NetworkError: Error {
    case badBaseUrl
    case badStatus(Int)
}
