
import Foundation
import Alamofire

extension APIClient {
    static func getArticles(completion:@escaping (Result<[Article], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(.articleDateFormatter)
        performRequest(route: ArticlesAPIRouter.articles, decoder: jsonDecoder, completion: completion)
    }
}
