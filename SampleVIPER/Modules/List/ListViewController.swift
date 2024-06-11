//
//  ListViewController.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

final class ListViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var newsListTableView: UITableView!
    
    // MARK: Properties
    var presenter: IListViewToPresenter?
    var tableViewAdapter: ListTableViewAdapter?
}

extension ListViewController: IListPresenterToView {
    
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
    
    func setupTableView() {
        newsListTableView.dataSource = tableViewAdapter
        newsListTableView.delegate = tableViewAdapter
        newsListTableView.registerCell(NewsListTableViewCell.self)
    }
}

// MARK: Lifecycle
extension ListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad?()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear?()
    }
}
