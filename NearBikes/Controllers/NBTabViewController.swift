//
//  NBTabViewController.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 30/10/24.
//

import UIKit

class NBTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTabs()
    }

    private func setupTabs() {
        let listBikesVC = NBListStationsViewController()
        let settingsVC = NBSettingsViewController()
            
        listBikesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
                
        let nav1 = UINavigationController(rootViewController: listBikesVC)
        let nav2 = UINavigationController(rootViewController: settingsVC)
                
        nav1.tabBarItem = UITabBarItem(title: "List of bikes avalable", image: UIImage(systemName: "bicycle"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
              
        for nav in [nav1, nav2] {
            nav.navigationBar.prefersLargeTitles = true
        }
            
        setViewControllers(
            [nav1, nav2],
            animated: true
        )
        }

}
