//
//  ApiClient.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation

class ApiClient {
    lazy var session: URLSessionProtocol = URLSession.shared
    
    func users() async throws -> [User] {
        let (data, _) = try await session.data(from: URL(string: "https:url")!, delegate: nil)
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
