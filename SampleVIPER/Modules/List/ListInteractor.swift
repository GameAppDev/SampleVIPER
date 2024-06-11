//
//  ListInteractor.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import Foundation

final class ListInteractor {
    
    // MARK: Properties
    weak var presenter: IListInteractorToPresenter?
    private var news: [NewsModel]
    
    init(news: [NewsModel]) {
        self.news = news
    }
}

extension ListInteractor: IListPresenterToInteractor {
    
    func getNews() -> [NewsModel] {
        news
    }
}
