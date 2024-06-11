//
//  NewsGetResponse.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import Foundation

struct NewsGetResponse: Codable {
    let status: String?
    let totalResults: Int?
    let news: [NewsModel]?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case status, totalResults, message
        case news = "articles"
    }
}

struct NewsModel: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
