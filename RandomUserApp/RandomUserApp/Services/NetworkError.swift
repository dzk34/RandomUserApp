//
//  NetworkError.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation

public enum NetworkError: LocalizedError {
    case failedResponse
    case failedDecoding
    case invalidUrl
    case invalidData
    case offline
    case unauthorized
    case unexpectedStatusCode
    case decode
    case unknown
    case invalidServerResponse
    
    public var customMessage: String {
        switch self {
        case .failedResponse:
            return "Error: Failed response"
        case .failedDecoding:
            return "Error: failed decoding"
        case .invalidUrl:
            return "Error: invalid URL"
        case .invalidData:
            return "Error: invalid data"
        case .invalidServerResponse:
            return "Error: invalid server response"
        default:
            return "Unknown error"
        }
    }
}

enum HTTPStatusCode: Int {
    case success = 200
    case created = 201
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case internalServerError = 500
    case unknown
}
