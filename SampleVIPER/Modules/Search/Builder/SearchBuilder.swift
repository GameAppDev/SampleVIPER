//
//  SearchBuilder.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

struct SearchBuilder {

    static func buildModule() -> UIViewController {
        let router = SearchRouter()
        let viewController = SearchViewController()
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        let networkManager = NetworkManager()
        
        router.view = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.presenter = presenter
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.networkManager = networkManager
        
        return viewController
    }
}
