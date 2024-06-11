//
//  ListBuilder.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

struct ListBuilder {

    static func buildModule(news: [NewsModel]) -> UIViewController {
        let router = ListRouter()
        let viewController = ListViewController()
        let presenter = ListPresenter()
        let interactor = ListInteractor(news: news)
        let tableViewAdapter = ListTableViewAdapter()
        let imageDownloadManager = ImageDownloadManager.shared
        
        router.view = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.presenter = presenter
        viewController.tableViewAdapter = tableViewAdapter
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        tableViewAdapter.presenter = presenter
        tableViewAdapter.imageDownloadManager = imageDownloadManager
        
        return viewController
    }
}
