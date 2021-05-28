//
//  ArticlesViewModel.swift
//  Networking
//
//  Created by gaurav.goyal19 on 28/05/21.
//  Copyright © 2021 Alaeddine Me. All rights reserved.
//

import Foundation

protocol ArticlesViewModelProtocol {
    func getArticlesFromServer()
}

class ArticlesViewModel: ArticlesViewModelProtocol {
    let api: ArticlesApiClientProtocol
    var articles: [Article]?
    
    init (apiClient: ArticlesApiClientProtocol) {
        self.api = apiClient
    }
    
    func getArticlesFromServer() {
        api.getArticles{ result in
            switch result {
            case .success(let articles):
                print("___________SUCCESS__________________")
                self.articles = articles
                print(articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
