//
//  LoginAPIRouter.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Alamofire
import Foundation

enum LoginAPIRouter {
    case login(email:String, password:String)
}

extension LoginAPIRouter: APIRouter {
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        return .post
    }
    
    // MARK: - Path
    var path: String {
        return "/login"
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [K.APIParameterKey.email: email, K.APIParameterKey.password: password]
        }
    }
}


//can be implemented as struct but enum should be preferred as in ArticlesAPIRouter as
//it can handle multiple related endpoints

//struct LoginAPIRouter: APIRouter {
//    var email: String
//    var password: String
//
//    init(email:String, password:String) {
//        self.email = email
//        self.password = password
//     }
//
//    // MARK: - HTTPMethod
//    var method: HTTPMethod = .post
//
//
//    // MARK: - Path
//    var path: String = "/login"
//
//    // MARK: - Parameters
//    private var parameters: Parameters? {
//        return [K.APIParameterKey.email: email, K.APIParameterKey.password: password]
//    }
//
//    private var headers: HTTPHeaders? = HTTPHeaders.commonHeaders()
//
//}
