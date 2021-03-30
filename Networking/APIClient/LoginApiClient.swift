
import Foundation
import Alamofire

extension APIClient {
    static func login(email: String, password: String, completion:@escaping (Result<User, AFError>)->Void) {
        performRequest(route: LoginAPIRouter.login(email: email, password: password), completion: completion)
    }
}
