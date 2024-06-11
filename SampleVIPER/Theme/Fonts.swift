//
//  Fonts.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import UIKit

extension UIFont {
    
    // MARK: NavigationBar
    static let navbarTitleFont = UIFont.robotoBold24
    
    // MARK: Search
    static let searchTFTextFont      = UIFont.robotoRegular18
    static let searchButtonTitleFont = UIFont.robotoMedium18
    
    // MARK: List
    static let listCellTextFont = UIFont.robotoRegular18
}

extension UIFont {
    
    private static let robotoRegular18 = UIFont(name: "Roboto-Regular", size: .init(18))
    private static let robotoMedium18  = UIFont(name: "Roboto-Medium", size: .init(18))
    private static let robotoBold24    = UIFont(name: "Roboto-Bold", size: .init(24))
}
