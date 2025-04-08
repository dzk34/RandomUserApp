//
//  UsersListViewModel.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation

protocol UsersListViewModelProtocol {
//    var dataPublisher: Published<[String]>.Publisher { get }
    func fetch() async
}

class UsersListViewModel: ObservableObject, UsersListViewModelProtocol {
//    var dataPublisher: Published<[String]>.Publisher { $data }
    @Published private(set) var data: [String] = []

    func fetch() async {
        data = ["day1", "day2", "day3", "day4", "day5", "day6", "day7"]
    }
}
