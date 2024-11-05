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
        let weatherVC = NBSettingsViewController()
        let travelVC = NBSettingsViewController()
        let favoriteStationsVC = NBSettingsViewController()
        let settingsVC = NBSettingsViewController()
            
        listBikesVC.navigationItem.largeTitleDisplayMode = .automatic
        weatherVC.navigationItem.largeTitleDisplayMode = .automatic
        travelVC.navigationItem.largeTitleDisplayMode = .automatic
        favoriteStationsVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
                
        let nav1 = UINavigationController(rootViewController: listBikesVC)
        let nav2 = UINavigationController(rootViewController: weatherVC)
        let nav3 = UINavigationController(rootViewController: travelVC)
        let nav4 = UINavigationController(rootViewController: favoriteStationsVC)
        let nav5 = UINavigationController(rootViewController: settingsVC)
                
        nav1.tabBarItem = UITabBarItem(title: "Bikes", image: UIImage(systemName: "bicycle"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "thermometer.sun.fill"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Travel", image: UIImage(systemName: "figure.outdoor.cycle"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 4)
        nav5.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 5)
              
        for nav in [nav1, nav2, nav3, nav4, nav5] {
            nav.navigationBar.prefersLargeTitles = true
        }
            
        setViewControllers(
            [nav1, nav2, nav3, nav4, nav5],
            animated: true
        )
        }

}
