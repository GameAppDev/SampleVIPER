//
//  SearchPresenter.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

final class SearchPresenter {
    
    // MARK: Properties
    weak var view: ISearchPresenterToView?
    var interactor: ISearchPresenterToInteractor?
    var router: ISearchPresenterToRouter?
}

extension SearchPresenter: ISearchViewToPresenter {
    
    func viewDidLoad() { }
    
    func viewWillAppear() {
        view?.setNavigationBar(
            title: "Search",
            leftButton: nil,
            rightButton: nil
        )
    }
}

extension SearchPresenter: ISearchInteractorToPresenter { }
