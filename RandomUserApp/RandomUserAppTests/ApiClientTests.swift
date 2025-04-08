//
//  ApiClientTests.swift
//  RandomUserAppTests
//
//  Created by Khaled on 08/04/2025.
//

import XCTest
@testable import RandomUserApp

final class ApiClientTests: XCTestCase {
    
    // to avoid the error about the async call (of apiClient.users())  in a function that does not support concurrency, we can do:
    // - wrap the call 'try await apiClient.users()' into a Task
    // - Or mark the test method as async
    
    // we can either use a 'do catch' block, or use the 'throws' keyword which means when there's an error thrown, this tests fails
    func  test_shouldReturnListOfUsers() async throws {
        let apiClient = ApiClient()
        let data = try XCTUnwrap("[{\"name\": \"Username\"}]".data(using: .utf8))
        let sessionMock = URLSessionProtocolMock(data: data)
        apiClient.session = sessionMock
        
        let users = try await apiClient.users()
        
        let firstUser = try XCTUnwrap(users.first)
        XCTAssertEqual(firstUser.name, "Username")
    }
}
