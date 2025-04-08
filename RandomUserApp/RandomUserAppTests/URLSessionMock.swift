//
//  URLSessionMock.swift
//  RandomUserAppTests
//
//  Created by Khaled on 08/04/2025.
//

import Foundation
@testable import RandomUserApp

class URLSessionProtocolMock: URLSessionProtocol {
    let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func data(from url: URL, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        guard let response = HTTPURLResponse(url: url,
                                             statusCode: 200,
                                             httpVersion: nil,
                                             headerFields: nil) else {
            fatalError()
        }
        return (data, response)
    }
}
