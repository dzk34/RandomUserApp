//
//  RequestProtocol.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
}

extension RequestProtocol {
    var host: String {
        APIConstants.host
    }

    var scheme: String {
        APIConstants.scheme
    }

    func createURLRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [URLQueryItem(name: "results", value: "10")]

        guard let url = components.url else { throw NetworkError.invalidUrl }

        return URLRequest(url: url)
    }
}

enum UsersRequest: RequestProtocol {
    case users
    
    var path: String {
        "/api"
    }
}
