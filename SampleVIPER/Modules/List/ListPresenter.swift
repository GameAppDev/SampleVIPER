//
//  ListPresenter.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

final class ListPresenter {
    
    // MARK: Properties
    weak var view: IListPresenterToView?
    var interactor: IListPresenterToInteractor?
    var router: IListPresenterToRouter?
}

extension ListPresenter: IListViewToPresenter {
    
    func viewDidLoad() {
        view?.setupTableView()
    }
    
    func viewWillAppear() {
        view?.setNavigationBar(
            title: "News List",
            leftButton: nil,
            rightButton: .close
        )
    }
}

extension ListPresenter: IListInteractorToPresenter { }

extension ListPresenter: IListAdapterToPresenter {
    
    func rowsCount() -> Int? {
        interactor?.getNews().count
    }
    
    func getListItem(index: Int) -> Any? {
        interactor?.getNews()[safe: index]
    }
    
    func listItemSelected(index: Int) {
        guard let news = interactor?.getNews(),
              let newsItem = news[safe: index]
        else { return }
        
        router?.navigateToDetail(newsItem: newsItem)
    }
}
