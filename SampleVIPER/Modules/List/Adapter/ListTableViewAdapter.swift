//
//  ListTableViewAdapter.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

final class ListTableViewAdapter: NSObject {

    // MARK: Properties
    var presenter: IListAdapterToPresenter?
    var imageDownloadManager: ImageDownloadManager?
}

extension ListTableViewAdapter: UITableViewDataSource {
    
    // MARK: Count
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.sectionCount() ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.rowsCount() ?? 0
    }
    
    // MARK: Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(cell: NewsListTableViewCell.self, indexPath: indexPath)
        else { return UITableViewCell() }
        
        guard let newsItem = presenter?.getListItem(index: indexPath.row) as? NewsModel
        else { return UITableViewCell() }
        
        cell.configureCell(
            with: newsItem,
            imageDownloadManager: imageDownloadManager
        )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ListTableViewAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.listItemSelected(index: indexPath.row)
    }
}
