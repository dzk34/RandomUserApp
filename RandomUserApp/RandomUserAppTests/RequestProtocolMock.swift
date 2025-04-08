//
//  RequestProtocolMock.swift
//  RandomUserAppTests
//
//  Created by Khaled on 08/04/2025.
//

import Foundation
@testable import RandomUserApp

enum RequestProtocolMock: RequestProtocol {
    case users

    var path: String {
        switch self {
        case .users:
            return "/api" //?results=10
        }
    }
}
