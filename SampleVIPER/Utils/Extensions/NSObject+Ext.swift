//
//  NSObject+Ext.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import Foundation

extension NSObject {
    
    public class var className: String {
        String(describing: self)
    }
}
