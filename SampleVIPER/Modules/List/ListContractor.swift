//
//  ListContractor.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import Foundation

protocol IListPresenterToView: IPresenterToView {
    func setNavigationBar(title: String?,
                          leftButton: CustomNavigationBar.ButtonType?,
                          rightButton: CustomNavigationBar.ButtonType?)
    func setupTableView()
}

protocol IListViewToPresenter: IViewToPresenter { }

protocol IListPresenterToInteractor: IPresenterToInteractor {
    func getNews() -> [NewsModel]
}

protocol IListInteractorToPresenter: IInteractorToPresenter { }

protocol IListPresenterToRouter: IPresenterToRouter {
    func navigateToDetail(newsItem: NewsModel)
}

protocol IListAdapterToPresenter: IAdapterToPresenter { }
