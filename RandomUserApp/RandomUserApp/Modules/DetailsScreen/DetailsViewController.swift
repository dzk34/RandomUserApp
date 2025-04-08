//
//  DetailsViewController.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    let data: String
    
    init(data: String) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("received data = \(data)")
    }
}
