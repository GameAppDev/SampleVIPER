//
//  UITableView+Ext.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

// MARK: Register & Dequeue
extension UITableView {
    
    public func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(
            nibFromClass(cell),
            forCellReuseIdentifier: cell.className
        )
    }
    
    public func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ cell: T.Type) {
        register(
            nibFromClass(cell),
            forHeaderFooterViewReuseIdentifier: cell.className
        )
    }
    
    public func dequeue<T: UITableViewCell>(cell: T.Type, indexPath: IndexPath) -> T? {
        dequeueReusableCell(
            withIdentifier: T.className,
            for: indexPath
        ) as? T
    }
    
    public func dequeue<T: UITableViewHeaderFooterView>(headerFooterView: T.Type) -> T? {
        dequeueReusableHeaderFooterView(withIdentifier: T.className) as? T
    }
    
    private func nibFromClass(_ type: UIView.Type) -> UINib {
        UINib(nibName: type.className, bundle: nil)
    }
}
