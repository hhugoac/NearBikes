//
//  NBSettingsViewController.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 30/10/24.
//

import UIKit

class NBSettingsViewController: UIViewController {
    
    let stationView = NBStationDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBackground
        view.addSubview(stationView)
    }
    
    private func addContraints() {
        NSLayoutConstraint.activate([
            stationView.topAnchor.constraint(equalTo: view.topAnchor),
            stationView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stationView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}
