//
//  ApiClient.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation

protocol APIClientProtocol {
    func perform(_ request: RequestProtocol) async throws -> Data
}

class ApiClient: APIClientProtocol {
    lazy var urlSession: URLSessionProtocol = URLSession.shared
    
    func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == HTTPStatusCode.success.rawValue else { throw NetworkError.invalidServerResponse }

        return data
    }
}
