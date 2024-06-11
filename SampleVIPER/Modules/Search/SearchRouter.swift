//
//  SearchRouter.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

final class SearchRouter {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    // MARK: Static Method
    static func returnVC() -> UIViewController {
        return SearchBuilder.buildModule()
    }
}

extension SearchRouter: ISearchPresenterToRouter { }
