//
//  Colors.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import UIKit

extension UIColor {
    
    // MARK: BaseVC
    static let baseViewBGColor = UIColor.primaryColor
    
    // MARK: NavigationBar
    static let navbarBGColor    = UIColor.secondaryColor
    static let navbarItemsColor = UIColor.primaryColor
    
    // MARK: Search
    static let searchTFBGColor        = UIColor.secondaryColor
    static let searchTFTextColor      = UIColor.primaryColor
    static let searchButtonBGColor    = UIColor.secondaryColor
    static let searchButtonTitleColor = UIColor.primaryColor
    
    // MARK: List
    static let listCellBGColor   = UIColor.secondaryColor
    static let listCellTextColor = UIColor.primaryColor
}

extension UIColor {
    
    private static let primaryColor   = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    private static let secondaryColor = UIColor(red: 0/255, green: 70/255, blue: 70/255, alpha: 1)
}
