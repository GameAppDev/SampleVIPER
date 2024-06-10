//
//  UIView+Ext.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import UIKit

extension UIView {
    
    @discardableResult
    public func loadNib<T: UIView>() -> T? {
        let nib = UINib(nibName: type(of: self).className,
                        bundle: Bundle(for: type(of: self)))
        return nib.instantiate(
            withOwner: T.self,
            options: nil
        ).first as? T
    }
}
