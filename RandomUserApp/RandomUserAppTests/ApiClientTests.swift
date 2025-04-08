//
//  ApiClientTests.swift
//  RandomUserAppTests
//
//  Created by Khaled on 08/04/2025.
//

import XCTest
@testable import RandomUserApp

final class ApiClientTests: XCTestCase {
    func  test_shouldReturnListOfUsers() {
        let apiClient = ApiClient()
        let users = try await apiClient.users()
    }
}
