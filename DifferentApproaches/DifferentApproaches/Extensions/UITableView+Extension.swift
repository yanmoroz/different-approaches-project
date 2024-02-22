//
//  UITableView+Extension.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(ofType: T.Type, for indexPath: IndexPath) -> T? {
        self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }
}
