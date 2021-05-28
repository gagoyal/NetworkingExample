//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by gaurav.goyal19 on 28/05/21.
//  Copyright © 2021 Alaeddine Me. All rights reserved.
//

import XCTest
@testable import Networking
import Alamofire

class NetworkingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testLoginViewModel() {
        let mockAPIClient = MockAPIClient()
        let viewModel = LoginViewModel.init(apiClient: mockAPIClient)
        viewModel.login(email: "abc", password: "xyz")
        XCTAssertTrue(mockAPIClient.loginWasCalled)
    }
    
    func testArticlesViewModel() {
        let mockAPIClient = MockAPIClient()
        let viewModel = ArticlesViewModel.init(apiClient: mockAPIClient)
        viewModel.getArticlesFromServer()
        XCTAssertTrue(mockAPIClient.getArticlesWasCalled)
        XCTAssertNotNil(viewModel.articles)
        XCTAssertTrue(viewModel.articles?.count == 2)
    }
    
    func testArticlesViewModelFailure() {
        let mockAPIClient = MockAPIClient()
        mockAPIClient.testingFailureCase = true
        let viewModel = ArticlesViewModel.init(apiClient: mockAPIClient)
        viewModel.getArticlesFromServer()
        XCTAssertTrue(mockAPIClient.getArticlesWasCalled)
        XCTAssertNil(viewModel.articles)
    }
}


class MockAPIClient: LoginApiClientProtocol, ArticlesApiClientProtocol  {
    var loginWasCalled = false
    var getArticlesWasCalled = false
    var testingFailureCase = false
    
    func login(email: String, password: String, completion: @escaping (Result<User, AFError>) -> Void) {
        loginWasCalled = true
        completion(.success(User(firstName: "Sam", lastName: "Hudson", email: "san@hudson.com", image: URL(string: "http://yahoo.com")!)))
    }
    
    func getArticles(completion: @escaping (Result<[Article], AFError>) -> Void) {
        getArticlesWasCalled = true
        let jsonData = loadJson(in: "articlesResponse")
        
        if testingFailureCase {
            completion(.failure(AFError.explicitlyCancelled))
        }
        else {
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .formatted(.articleDateFormatter)
                let articles = try jsonDecoder.decode([Article].self, from: jsonData)
                completion(.success(articles))
            } catch {
                completion(.failure(AFError.explicitlyCancelled))
            }
        }
    }
    
    func loadJson(in file: String) -> Data {
        let path = Bundle(for: MockAPIClient.self).path(forResource: file, ofType: "json")!
        let filePath = URL(fileURLWithPath: path)
        let data = (try? Data(contentsOf: filePath, options: .mappedIfSafe))!
        return data
    }
}
