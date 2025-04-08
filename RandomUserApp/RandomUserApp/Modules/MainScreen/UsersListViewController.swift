//
//  ViewController.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import UIKit
import Combine

class UsersListViewController: UIViewController {
    private var cancellables: Set<AnyCancellable> = []

    let viewModel: UsersListViewModel

    init(viewModel: UsersListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    let data = ["day1", "day2", "day3", "day4", "day5", "day6", "day7"]
    
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
        
        viewModel.$data
            .receive(on: RunLoop.main)
            .sink { [weak self] data in
//                        DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
//                        }
            }.store(in: &cancellables)
        
        Task {
            await viewModel.fetch()
        }

        setupUI()
        setupConstraints()
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
        viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.data[indexPath.row]
        return cell
    }
}

extension UsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailsViewController(data: viewModel.data[indexPath.row])
//        navigationController?.pushViewController(detailVC, animated: true)
        show(detailVC, sender: self)
    }
}
