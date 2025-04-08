//
//  DependencyProvider.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation

class DependencyProvider {
    static var apiClient: APIClientProtocol {
        return ApiClient()
    }
    
    static var viewModel: UsersListViewModelProtocol {
        return UsersListViewModel()//(service: self.service)
    }
}
