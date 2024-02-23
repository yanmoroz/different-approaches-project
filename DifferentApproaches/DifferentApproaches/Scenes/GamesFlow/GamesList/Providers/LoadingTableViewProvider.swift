//
//  LoadingTableViewProvider.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import UIKit

final class LoadingTableViewProvider: NSObject {
    
    private let configuration: Configuration
    
    init(configuration: Configuration = Configuration()) {
        self.configuration = configuration
    }
    
    struct Configuration {
        
        let numberOfSection: Int
        let numberOfRowInSection: Int
        
        init(numberOfSection: Int = 1, numberOfRowInSection: Int = 100) {
            self.numberOfSection = numberOfSection
            self.numberOfRowInSection = numberOfRowInSection
        }
    }
}

// MARK: - TableViewProvider
extension LoadingTableViewProvider: TableViewProvider {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        configuration.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        configuration.numberOfRowInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(ofType: LoadingTableViewCell.self, for: indexPath) else {
            return UITableViewCell()
        }
        return cell
    }
}
