//
//  NetworkManager.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import Foundation
import Alamofire

typealias Success<T: Codable> = (BaseResponse<T>) -> Void
typealias Error = (BaseError) -> Void

final class NetworkManager: Networkable {
    
    func fetch<T>(
        router: NetworkRouter,
        onSuccess: @escaping (BaseResponse<T>) -> Void,
        onError: @escaping (BaseError) -> Void
    ) where T : Decodable, T : Encodable {
        AF.request(
            router.url,
            method: router.method,
            parameters: router.parameters
        ).validate().responseDecodable(of: T.self) { response in
            guard let model = response.value else {
                onError(BaseError(response.error))
                return
            }
            onSuccess(BaseResponse.init(model: model, message: "SUCCESS"))
        }
    }
}
