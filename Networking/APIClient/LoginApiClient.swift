
import Foundation
import Alamofire

protocol LoginApiClientProtocol {
    func login(email: String, password: String, completion:@escaping (Result<User, AFError>)->Void)
}

extension APIClient: LoginApiClientProtocol {
    func login(email: String, password: String, completion:@escaping (Result<User, AFError>)->Void) {
        performRequest(route: LoginAPIRouter.login(email: email, password: password), completion: completion)
    }
}
