//
//  ListRouter.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

final class ListRouter {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    // MARK: Static Method
    static func getModuleVC(news: [NewsModel]) -> UIViewController {
        ListBuilder.buildModule(news: news)
    }
}

extension ListRouter: IListPresenterToRouter {
    
    func navigateToDetail(newsItem: NewsModel) { }
}
