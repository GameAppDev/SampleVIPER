//
//  SearchViewController.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

final class SearchViewController: BaseViewController {
    
    // MARK: Properties
    var presenter: ISearchViewToPresenter?
}

extension SearchViewController: ISearchPresenterToView {
    
    func setNavigationBar(
        title: String?,
        leftButton: CustomNavigationBar.ButtonType?,
        rightButton: CustomNavigationBar.ButtonType?
    ) {
        setNavigationBarItems(
            title: title,
            leftButton: leftButton,
            rightButton: rightButton
        )
    }
}

// MARK: Lifecycle
extension SearchViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad?()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear?()
    }
}
