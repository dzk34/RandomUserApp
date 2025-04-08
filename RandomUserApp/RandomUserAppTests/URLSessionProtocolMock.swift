//
//  URLSessionProtocolMock.swift
//  RandomUserAppTests
//
//  Created by Khaled on 08/04/2025.
//

import Foundation
@testable import RandomUserApp

class URLSessionProtocolMock: URLSessionProtocol {
    let data: Data
    var dataURL: URL?

    init(data: Data) {
        self.data = data
    }
    
    func data(from url: URL, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        dataURL = url

        guard let response = HTTPURLResponse(url: url,
                                             statusCode: 200,
                                             httpVersion: nil,
                                             headerFields: nil) 
        else {
            fatalError()
        }
        
        return (data, response)
    }
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        guard let url = request.url, let response = HTTPURLResponse(url: url,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)
        else {
            fatalError()
        }

        dataURL = url

        return (data, response)
    }
}

extension URLSessionProtocolMock {
    convenience init?(users: [User]) {
        do {
            let data = try JSONEncoder().encode(users)
            self.init(data: data)
        } catch {
            fatalError()
        }
    }
}
