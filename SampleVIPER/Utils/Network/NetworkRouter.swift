//
//  NetworkRouter.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import Foundation
import Alamofire

enum NetworkRouter {
    
    case getGitHubRepos
    case getNews
    
    private var baseURL: String {
        switch self {
        case .getGitHubRepos: return "https://api.github.com"
        case .getNews: return "https://newsapi.org/v2"
        }
    }
    
    private var path: String {
        switch self {
        case .getGitHubRepos: return "/orgs/google/repos"
        case .getNews: return "/everything"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getGitHubRepos, .getNews: return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getGitHubRepos: return nil
        case .getNews: return nil
        }
    }
    
    var url: String {
        return baseURL + path
    }
}
