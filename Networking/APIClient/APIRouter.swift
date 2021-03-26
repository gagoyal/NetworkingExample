
import Foundation
import Alamofire

public protocol APIRouter: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var httpHeaders: HTTPHeaders { get }
    var parameters: [String: Any] { get }
    var encoding: ParameterEncoding { get }
}

extension APIRouter {
    //default base url for app services. Incase some service requires other base url, its router can implement it.
    var baseURL: String {
        return K.ProductionServer.baseURL
    }

    //default headers. if additional are required, service router should merge it.
    var httpHeaders: HTTPHeaders {
        return HTTPHeaders.commonHeaders()
    }
    
    var parameters: [String : Any] {
        return [:]
    }
    
    //most commonly ones handled based on method. Router can implement if required.
    var encoding: ParameterEncoding {
        return (method == .get) ? URLEncoding.default : JSONEncoding.default
    }
    
    //protocol requirement.
    func asURLRequest() throws -> URLRequest {
        let originalRequest = try URLRequest(url: baseURL.appending(path),
                                             method: method,
                                             headers: httpHeaders)
        let encodedRequest = try encoding.encode(originalRequest,
                                                 with: parameters)
        return encodedRequest
    }
}

