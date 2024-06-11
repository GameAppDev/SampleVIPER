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
}

extension SearchInteractor: ISearchPresenterToInteractor { }
