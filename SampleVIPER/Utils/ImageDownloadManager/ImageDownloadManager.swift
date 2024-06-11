//
//  ImageDownloadManager.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import UIKit
import Kingfisher

final class ImageDownloadManager: NSObject {
    
    // MARK: Singleton
    static let shared = ImageDownloadManager()
    
    // MARK: Init
    private override init() {
        super.init()
    }
    
    // MARK: Set Image to ImageView and Get Image Data
    func set(
        imageView: UIImageView,
        urlString: String,
        completion: ((Data?) -> Void)? = nil
    ) {
        imageView.kf.setImage(
            with: URL(string: urlString),
            options: [
                .transition(.fade(0.25))
            ]
        ) { result in
            switch result {
            case .success(let value):
                if let completion {
                    completion(value.data())
                }
            case .failure(let error):
                print(error)
                completion?(nil)
            }
        }
    }
    
    // MARK: Get Image Data
    func download(
        urlString: String,
        completion: ((Data?) -> Void)? = nil
    ) {
        guard let url = URL(string: urlString) else {
            completion?(nil)
            return
        }
        
        let resource = KF.ImageResource(downloadURL: url)
        
        KingfisherManager.shared.retrieveImage(
            with: resource,
            options: [
                .transition(.fade(0.25))
            ]
        ) { result in
            switch result {
            case .success(let value):
                if let completion {
                    completion(value.data())
                }
            case .failure(let error):
                print(error)
                completion?(nil)
            }
        }
    }
}
