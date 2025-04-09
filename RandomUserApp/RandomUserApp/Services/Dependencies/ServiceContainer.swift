//
//  ServiceContainer.swift
//  RandomUserApp
//
//  Created by Khaled on 09/04/2025.
//

import Foundation

// MARK: Injected Services

private struct APIClientKey: InjectedServiceKey {
    static var currentValue: APIClientProtocol = ApiClient()
}

private struct URLSessionKey: InjectedServiceKey {
    static var currentValue: URLSessionProtocol = URLSession(configuration: .default)
}

private struct DataParserKey: InjectedServiceKey {
    static var currentValue: DataParserProtocol = DataParser()
}

private struct RequestManagerKey: InjectedServiceKey {
    static var currentValue: RequestManagerProtocol = RequestManager()
}

private struct UsersListViewModelKey: InjectedServiceKey {
    static var currentValue: UsersListViewModelProtocol = UsersListViewModel()
}


extension InjectedServiceValues {
    var apiClient: APIClientProtocol {
        get { Self[APIClientKey.self] }
        set { Self[APIClientKey.self] = newValue }
    }

    var urlSession: URLSessionProtocol {
        get { Self[URLSessionKey.self] }
        set { Self[URLSessionKey.self] = newValue }
    }
    
    var dataParser: DataParserProtocol {
        get { Self[DataParserKey.self] }
        set { Self[DataParserKey.self] = newValue }
    }
    
    var requestManager: RequestManagerProtocol {
        get { Self[RequestManagerKey.self] }
        set { Self[RequestManagerKey.self] = newValue }
    }

    var usersListViewModel: UsersListViewModelProtocol {
        get { Self[UsersListViewModelKey.self] }
        set { Self[UsersListViewModelKey.self] = newValue }
    }
}
