//
//  BaseContractor.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import UIKit

// MARK: - PresenterToView
protocol IPresenterToView: AnyObject {
    func showIndicatorView()
    func hideIndicatorView()
    func showPopup(identifier: String?,
                   content: String,
                   dismissAfterButtonClick: Bool)
}

extension UIViewController: IPresenterToView {
    
    func showIndicatorView() { }
    
    func hideIndicatorView() { }
    
    func showPopup(identifier: String?,
                   content: String,
                   dismissAfterButtonClick: Bool) { }
}

// MARK: - ViewToPresenter
@objc
protocol IViewToPresenter: AnyObject {
    @objc optional func viewDidLoad()
    @objc optional func viewWillAppear()
    @objc optional func viewDidAppear()
    @objc optional func viewWillLayoutSubviews()
    @objc optional func viewDidLayoutSubviews()
    @objc optional func viewWillDisappear()
    @objc optional func viewDidDisappear()
}

// MARK: - PresenterToInteractor
@objc
protocol IPresenterToInteractor: AnyObject { }

// MARK: - InteractorToPresenter
@objc
protocol IInteractorToPresenter: AnyObject { }

// MARK: - PresenterToRouter
@objc
protocol IPresenterToRouter: AnyObject { }

// MARK: - AdapterToPresenter
protocol IAdapterToPresenter: AnyObject {
    func sectionCount() -> Int?
    func rowsCount() -> Int?
    func rowsCount(in section: Int) -> Int?
    func isLastItem(_ index: Int) -> Bool?
    func getListItem(index: Int) -> Any?
    func listItemSelected(index: Int)
}

extension IAdapterToPresenter {
    func sectionCount() -> Int? { return 1 }
    func rowsCount() -> Int? { return 0 }
    func rowsCount(in section: Int) -> Int? { return 0 }
    func isLastItem(_ index: Int) -> Bool? { rowsCount() == index + 1 }
}
