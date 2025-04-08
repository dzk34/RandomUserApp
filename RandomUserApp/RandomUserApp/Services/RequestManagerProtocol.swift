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
    let apiClient: APIClientProtocol
    let dataParser: DataParserProtocol
    
    init(apiClient: APIClientProtocol, dataParser: DataParserProtocol) {
        self.apiClient = apiClient
        self.dataParser = dataParser
    }
    
//    let dataParser: APIClientProtocol = ApiClient()

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
