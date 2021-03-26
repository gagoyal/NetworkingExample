//
//  ArticlesAPIRouter.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Alamofire
import Foundation

//Implementation using enum for multiple related services

enum ArticlesAPIRouter {
    case articles
    case article(id: Int)
}

extension ArticlesAPIRouter: APIRouter {

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .articles, .article:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .articles:
            return "/articles/all.json"
        case .article(let id):
            return "/article/\(id)"
        }
    }
}
