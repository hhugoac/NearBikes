//
//  ListBikesViewController.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 30/10/24.
//

import UIKit

class NBListStationsViewController: UIViewController {
    
    let listStatitionsView = NBListStationsUIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Near Stations:"
        view.addSubview(listStatitionsView)
        addConstraints()
    }

    private func addConstraints()  {
        NSLayoutConstraint.activate([
            listStatitionsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listStatitionsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            listStatitionsView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            listStatitionsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
