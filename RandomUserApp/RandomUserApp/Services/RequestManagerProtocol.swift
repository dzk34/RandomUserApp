//
//  RequestManager.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol, ObservableObject {
    @Inject(\.apiClient) var apiClient: APIClientProtocol
    @Inject(\.dataParser) var dataParser: DataParserProtocol

    func perform<T>(_ request: RequestProtocol) async throws -> T where T : Decodable {
        let data = try await apiClient.perform(request)
        
        let decoded: T = try dataParser.parse(data: data)
        return decoded
    }
}

public enum RequestManagerError: LocalizedError {
    case noData
    case unknownError
    
    public var customMessage: String {
        switch self {
        case .noData:
            return "Request returned no data"
        case .unknownError:
            return "Unkown error"
        }
    }
}
