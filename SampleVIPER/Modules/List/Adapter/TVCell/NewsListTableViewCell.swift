//
//  NewsListTableViewCell.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit

final class NewsListTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var newsContentLabel: UILabel!
    
    // MARK: Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
    }
    
    func configureCell(
        with news: NewsModel,
        imageDownloadManager: ImageDownloadManager?
    ) {
        newsContentLabel.text = news.title ?? "error"
        newsImageView.image = UIImage(systemName: "doc")
        if let imageDownloadManager,
           let imageUrl = news.urlToImage {
            imageDownloadManager.download(
                urlString: imageUrl,
                completion: { [weak self] (imageData: Data?) in
                    if let imageData {
                        self?.newsImageView.image = UIImage(data: imageData)
                    }
                }
            )
        }
    }
    
    private func setupCell() {
        DispatchQueue.main.async { [weak self] in
            self?.containerView.backgroundColor = .listCellBGColor
            self?.newsContentLabel.textColor = .listCellTextColor
            self?.newsContentLabel.font = .listCellTextFont
        }
    }
}
