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
    case getNews(request: NewsGetRequest?)
    
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
    
    var url: String {
        return baseURL + path
    }
    
    private var token: String? {
        switch self {
        default: return nil
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
        case .getNews(let request):
            return request?.dictionary
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default: return JSONEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        default:
            return HTTPHeaders(["Content-Type": "application/json",
                                "Authorization": "Bearer \(token ?? "")"])
        }
    }
}
