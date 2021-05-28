//
//  ArticlesViewController.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
    var loginViewModel: LoginViewModelProtocol
    var articlesViewModel: ArticlesViewModelProtocol
    
    init(loginVM: LoginViewModelProtocol, articlesVM: ArticlesViewModelProtocol) {
        self.loginViewModel = loginVM
        self.articlesViewModel = articlesVM
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.loginViewModel = LoginViewModel(apiClient: APIClient())
        self.articlesViewModel = ArticlesViewModel(apiClient: APIClient())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        
        // Test getArticles request
        articlesViewModel.getArticlesFromServer()

        // Test Login request
        loginViewModel.login(email: "test@gmail.com", password: "myPassword")
    }
}
