//
//  SearchViewController.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

final class SearchViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var searchButton: UIButton!
    
    // MARK: Properties
    var presenter: ISearchViewToPresenter?
}

// MARK: Actions
extension SearchViewController {
    
    @IBAction private func searchButtonClicked(_ sender: UIButton) {
        presenter?.handleSearchButtonClicked(
            searchedKey: searchTextField.text
        )
    }
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
    
    func setupSearchTextField() {
        searchTextField.backgroundColor = .searchTFBGColor
        searchTextField.textColor = .searchTFTextColor
        searchTextField.tintColor = .searchTFTextColor
        searchTextField.font = .searchTFTextFont
    }
    
    func setupSearchButton() {
        searchButton.backgroundColor = .searchButtonBGColor
        searchButton.setTitleColor(.searchButtonTitleColor, for: .normal)
        searchButton.titleLabel?.font = .searchButtonTitleFont
    }
    
    func setSearchButton(title: String) {
        searchButton.setTitle(title, for: .normal)
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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        presenter?.viewWillLayoutSubviews?()
    }
}
