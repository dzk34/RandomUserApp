//
//  ViewController.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import UIKit
import Combine

class UsersListViewController: UIViewController {
    @Inject(\.usersListViewModel) var viewModel: UsersListViewModelProtocol

    private var cancellables: Set<AnyCancellable> = []
    var usersData: [User] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        fetchData()
        setupUI()
        setupConstraints()
    }
    
    func fetchData() {
        viewModel.dataPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] data in
                self?.usersData = data
                self?.tableView.reloadData()
            }.store(in: &cancellables)
        
        Task {
            await viewModel.fetchData()
        }
    }
}

// MARK: UI Setup
extension UsersListViewController {
    func setupUI() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = usersData[indexPath.row]
        cell.textLabel?.text = user.name.first
        return cell
    }
}

extension UsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailsViewController(data: usersData[indexPath.row])
//        navigationController?.pushViewController(detailVC, animated: true)
        show(detailVC, sender: self)
    }
}
