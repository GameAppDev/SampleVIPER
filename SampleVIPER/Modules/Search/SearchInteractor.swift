//
//  SearchInteractor.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import Foundation

final class SearchInteractor {
    
    // MARK: Properties
    weak var presenter: ISearchInteractorToPresenter?
    var networkManager: Networkable?
}

extension SearchInteractor: ISearchPresenterToInteractor {
    
    func fetchNews(searchedKey: String) {
        networkManager?.fetch(
            router: .getNews(request: .init(searchedKey: searchedKey)),
            
            onSuccess: { [weak self] (response: BaseResponse<NewsGetResponse>) in
                self?.presenter?.newsFetchedOnSuccess(news: response.model?.news)
            },
            
            onError: { [weak self] (error) in
                self?.presenter?.newsFetchedOnError(
                    statusCode: error.statusCode,
                    message: error.errorMessage
                )
            }
        )
    }
}
