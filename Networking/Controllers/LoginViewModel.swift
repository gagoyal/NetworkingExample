//
//  LoginViewModel.swift
//  Networking
//
//  Created by gaurav.goyal19 on 28/05/21.
//  Copyright © 2021 Alaeddine Me. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol {
    func login(email: String, password: String)
}

class LoginViewModel: LoginViewModelProtocol {
    let api: LoginApiClientProtocol
    
    init (apiClient: LoginApiClientProtocol) {
        self.api = apiClient
    }
    
    func login(email: String, password: String) {
        api.login(email: email, password: password) { result in
            switch result {
            case .success(let user):
                print("___________SUCCESS__________________")
                print(user)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
