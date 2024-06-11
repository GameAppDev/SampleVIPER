//
//  Array+Ext.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import Foundation

extension Array {
    
    public subscript (safe index: Index) -> Element? {
        (0 <= index && index < count) ? self[index] : nil
    }
    
    public var isNotEmpty: Bool {
        !isEmpty
    }
}
