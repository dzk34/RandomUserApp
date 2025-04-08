//
//  ApiClient.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation

protocol APIClientProtocol {
//    func users() async throws -> [User]
    func perform(_ request: RequestProtocol) async throws -> Data
}

class ApiClient: APIClientProtocol {
    lazy var urlSession: URLSessionProtocol = URLSession.shared
    
    func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == HTTPStatusCode.success.rawValue else { throw NetworkError.invalidServerResponse }

        return data
    }

//    func users() async throws -> [User] {
//        let (data, _) = try await session.data(from: URL(string: " https://randomuser.me")!, delegate: nil)
//        
//        return try JSONDecoder().decode([User].self, from: data)
//    }
}
