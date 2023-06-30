//
//  DashboardViewController.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 26/06/2023.
//

import UIKit

final class DashboardViewController: UITabBarController {
    var mainCoordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.navigationItem.hidesBackButton = true
        
        let homeController = HomeController()
        let searchController = SearchController()
        let cartController = CartController()
        let profileController = ProfileController()
        
        viewControllers = [homeController, searchController, cartController, profileController]
        
        homeController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 1)
        searchController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        cartController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 3)
        profileController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 4)
        
        if let items = tabBar.items {
             // Set the tint color for the unselected state
             for item in items {
                 item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.kitIconGrey], for: .normal)
             }
             
             // Set the tint color for the selected state
             tabBar.tintColor = UIColor.primary
         }
    }
}
