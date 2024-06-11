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
    
    func viewDidLoad() {
        view?.setSearchButton(title: "Search")
    }
    
    func viewWillAppear() {
        view?.setNavigationBar(
            title: "Search",
            leftButton: nil,
            rightButton: nil
        )
    }
    
    func viewWillLayoutSubviews() {
        view?.setupSearchTextField()
        view?.setupSearchButton()
    }
    
    func handleSearchButtonClicked(searchedKey: String?) {
        guard let searchedKey else { return }
        
        view?.showIndicatorView()
        interactor?.fetchNews(searchedKey: searchedKey)
    }
}

extension SearchPresenter: ISearchInteractorToPresenter {
    
    func newsFetchedOnSuccess(news: [NewsModel]?) {
        view?.hideIndicatorView()
        guard let news, news.isNotEmpty else { return }
        router?.navigateToList(news: news)
    }
    
    func newsFetchedOnError(statusCode: Int?, message: String?) {
        view?.hideIndicatorView()
        view?.showPopup(
            identifier: "id",
            content: message ?? "error",
            dismissAfterButtonClick: true
        )
    }
}
