//
//  Networkable.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import Foundation

protocol Networkable {
    
    func fetch<T: Codable>(
        router: NetworkRouter,
        onSuccess: @escaping (BaseResponse<T>) -> Void,
        onError: @escaping (BaseError) -> Void
    )
}
