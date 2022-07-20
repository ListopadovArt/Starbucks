//
//  HomeViewController.swift
//  Starbucks
//
//  Created by Artem Listopadov on 20.07.22.
//

import UIKit

class HomeViewController: StarBucksViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setTabBarImage(imageName: "house.fill", title: "Home")
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Hello, Artem Listopadov ☀️"
    }
    
}

