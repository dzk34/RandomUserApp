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
    
    // to avoid the error about the async call (of sut.perform())  in a function that does not support concurrency, we can do:
    // - wrap the call 'try await sut.perform()' into a Task
    // - Or mark the test method as async
    
    // we can either use a 'do catch' block, or use the 'throws' keyword which means when there's an error thrown, this tests fails
    func test_performRequest_shouldReturnData() async throws {
        let request = RequestProtocolMock.users
        let data = try await sut.perform(request)
        XCTAssertNotNil(data)
    }
    
    func test_products_shouldFetchFromCorrectURL() async throws {
        let request = RequestProtocolMock.users
        _ = try await sut.perform(request)

        let expectedURL = try XCTUnwrap(URL(string: "https://randomuser.me/api"))
        XCTAssertEqual(sessionMock.dataURL, expectedURL)
    }
}
