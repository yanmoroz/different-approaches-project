//
//  Error+Extension.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import OSLog

extension Error {
    
    func log() {
        Logger().error("\(self.localizedDescription)")
    }
}
