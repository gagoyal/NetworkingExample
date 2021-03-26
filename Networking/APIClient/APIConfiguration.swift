//
//  APIConfiguration.swift
//  Networking
//
//  Created by gagoyal on 26/03/21.
//

import Foundation
import Alamofire

//this class should hold all common logic for services.
//it may even include something like tokenHeader() or authHeader() etc.
//caller should always merge headers.

extension HTTPHeaders {
    static func commonHeaders() -> HTTPHeaders {
        var headers = HTTPHeaders.init()
        headers.add(name: HTTPHeaderField.acceptType.rawValue, value: ContentType.json.rawValue)
        headers.add(name: HTTPHeaderField.contentType.rawValue, value: ContentType.json.rawValue)
        return headers
    }
}
