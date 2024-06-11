//
//  NewsGetRequest.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import Foundation

struct NewsGetRequest: Encodable {
    let searchedKey: String
    let page: Int
    let apiKey: String
    
    init(searchedKey: String, page: Int = 1) {
        self.searchedKey = searchedKey
        self.page = page
        self.apiKey = "210f5293f4124bacb399b01412c55fbc"
    }
    
    enum CodingKeys: String, CodingKey {
        case searchedKey = "q"
        case page, apiKey
    }
}
