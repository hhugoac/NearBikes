//
//  ListBikesViewController.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 30/10/24.
//

import UIKit

class NBListStationsViewController: UIViewController {
    let viewModel = NBListStationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        viewModel.fetchListStations()
    }

}
