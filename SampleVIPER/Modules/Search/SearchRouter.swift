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
    static func getModuleVC() -> UIViewController {
        SearchBuilder.buildModule()
    }
}

extension SearchRouter: ISearchPresenterToRouter {
    
    func navigateToList(news: [NewsModel]) {
        view?.presentWithNavigationController(
            ListRouter.getModuleVC(news: news)
        )
    }
}
