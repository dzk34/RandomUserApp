//
//  APIClientMock.swift
//  RandomUserAppTests
//
//  Created by Khaled on 08/04/2025.
//

import Foundation
@testable import RandomUserApp

class APIClientMock: APIClientProtocol {
    let urlSession: URLSessionProtocol

    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }

    func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == HTTPStatusCode.success.rawValue else { throw NetworkError.invalidServerResponse }

        return data
    }
}
