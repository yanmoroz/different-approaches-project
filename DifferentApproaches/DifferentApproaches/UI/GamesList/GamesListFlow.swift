//
//  GamesListFlow.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

enum GamesListFlow {
    enum ViewState {
        case loading
        case loadSucceed([Game])
        case loadFailed(Error)
    }
}
