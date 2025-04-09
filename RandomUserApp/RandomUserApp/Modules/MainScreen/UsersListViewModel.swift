//
//  UsersListViewModel.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation

protocol UsersListViewModelProtocol {
    var dataPublisher: Published<[User]>.Publisher { get }
    func fetchData() async
}

class UsersListViewModel: ObservableObject, UsersListViewModelProtocol {
    var dataPublisher: Published<[User]>.Publisher { $data }
    @Published private(set) var data: [User] = []
    
    @Inject(\.requestManager) var requestManager: RequestManagerProtocol

    func fetchData() async {
        do {
            let requestData = UsersRequest.users
            let users: UserList = try await requestManager.perform(requestData)
            self.data = users.results
        } catch {
//            App.State.unknown
            print("dzk \(error)")
        }
    }
}
