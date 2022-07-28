//
//  RewardTileViewController.swift
//  Starbucks
//
//  Created by Artem Listopadov on 25.07.22.
//

import UIKit

class RewardsTileViewController: UIViewController {
    
    let rewardsTileView = RewardsTileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension RewardsTileViewController {
    func style() {
        rewardsTileView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(rewardsTileView)
        
        NSLayoutConstraint.activate([
            rewardsTileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardsTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardsTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardsTileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
