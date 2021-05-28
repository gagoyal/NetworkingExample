
import Foundation
import Alamofire

protocol ArticlesApiClientProtocol {
    func getArticles(completion:@escaping (Result<[Article], AFError>)->Void)
}

extension APIClient: ArticlesApiClientProtocol {
    func getArticles(completion:@escaping (Result<[Article], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(.articleDateFormatter)
        performRequest(route: ArticlesAPIRouter.articles, decoder: jsonDecoder, completion: completion)
    }
}
