//
//  ViewInterface.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import Foundation

protocol ViewInterface: AnyObject {
    func showError(_ error: Error)
}

extension ViewInterface {
    func showError(_ error: Error) {
        print(error.localizedDescription)
    }
}
