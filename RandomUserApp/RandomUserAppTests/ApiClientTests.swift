//
//  ApiClientTests.swift
//  RandomUserAppTests
//
//  Created by Khaled on 08/04/2025.
//

import XCTest
@testable import RandomUserApp

final class ApiClientTests: XCTestCase {
    var sut: APIClientProtocol!
    var sessionMock: URLSessionProtocolMock!
//    var dataParser: DataParserProtocol!

    override func setUpWithError() throws {
        let user1 = User(name: "Username", gender: "Male")
        let user2 = User(name: "Firstname", gender: "Female")

        sessionMock = try XCTUnwrap(URLSessionProtocolMock(users: [user1, user2]))
        sut = APIClientMock(urlSession: sessionMock)
//        dataParser = DataParser()
    }
    
    override func tearDownWithError() throws {
        sessionMock = nil
        sut = nil
    }
    
    // to avoid the error about the async call (of apiClient.users())  in a function that does not support concurrency, we can do:
    // - wrap the call 'try await apiClient.users()' into a Task
    // - Or mark the test method as async
    
    // we can either use a 'do catch' block, or use the 'throws' keyword which means when there's an error thrown, this tests fails
    func  test_shouldReturnListOfUsers() async throws {
        let users = try await sut.users()
        
        let firstUser = try XCTUnwrap(users.first)
        XCTAssertEqual(firstUser.name, "Username")
    }
    
    func test_performRequest_shouldReturnData() async throws {
        let request = RequestMock.products
        let data = try await sut.perform(request)
        XCTAssertNotNil(data)
    }
}
