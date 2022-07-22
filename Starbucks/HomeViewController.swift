//
//  HomeViewController.swift
//  Starbucks
//
//  Created by Artem Listopadov on 20.07.22.
//

import UIKit

class HomeViewController: StarBucksViewController {
    
    let headerView = HomeHeaderView()
    var headerViewTopConstraint: NSLayoutConstraint?
    let scrollView = UIScrollView()
    let rootStackView = UIStackView()
    
    let tiles = [
        TileViewController(title: "Breakfast made meatless",
                           subtitle: "Try the Beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegetarian and protein-packed.",
                           imageName: "meatless"),
        TileViewController(title: "Uplifting our communities",
                           subtitle: "Thanks to our partners' nominations, The Starbucks Foundation is donating $145K to more than 50 local charities.",
                           imageName: "communities"),
        TileViewController(title: "Spend at least $15 for 50 Bonus Stars",
                           subtitle: "Collect 50 Bonus Stars when you spend at least $15 pre-tax.",
                           imageName: "bonus"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setTabBarImage(imageName: "house.fill", title: "Home")
        style()
        layout()
    }
    
    private func setupScrollView(){
        scrollView.delegate = self
    }
}


extension HomeViewController {
    
    private func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.axis = .vertical
        rootStackView.spacing = 8
    }
    
    private func layout() {
        view.addSubview(headerView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(rootStackView)
        
        for tile in tiles{
            addChild(tile)
            rootStackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            rootStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            rootStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
}

// MARK: Animating scrollView
extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        let swipingDown = y <= 0
        let shouldSnap = y > 30
        let labelHeight = headerView.greetingLabel.frame.height + 16 // label + spacer (102)
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.greetingLabel.alpha = swipingDown ? 1.0 : 0.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        })
    }
}
