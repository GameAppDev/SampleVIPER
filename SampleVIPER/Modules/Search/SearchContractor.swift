//
//  SearchContractor.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import Foundation

protocol ISearchPresenterToView: IPresenterToView {
    func setNavigationBar(title: String?,
                          leftButton: CustomNavigationBar.ButtonType?,
                          rightButton: CustomNavigationBar.ButtonType?)
    func setupSearchTextField()
    func setupSearchButton()
    func setSearchButton(title: String)
}

protocol ISearchViewToPresenter: IViewToPresenter {
    func handleSearchButtonClicked(searchedKey: String?)
}

protocol ISearchPresenterToInteractor: IPresenterToInteractor {
    func fetchNews(searchedKey: String)
}

protocol ISearchInteractorToPresenter: IInteractorToPresenter { 
    func newsFetchedOnSuccess(news: [NewsModel]?)
    func newsFetchedOnError(statusCode: Int?, message: String?)
}

protocol ISearchPresenterToRouter: IPresenterToRouter {
    func navigateToList(news: [NewsModel])
}
