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
}

protocol ISearchViewToPresenter: IViewToPresenter { }

protocol ISearchPresenterToInteractor: IPresenterToInteractor { }

protocol ISearchInteractorToPresenter: IInteractorToPresenter { }

protocol ISearchPresenterToRouter: IPresenterToRouter { }
