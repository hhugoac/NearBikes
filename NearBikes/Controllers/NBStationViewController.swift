//
//  NBStationViewController.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 14/11/24.
//

import UIKit

class NBStationViewController: UIViewController {

    let stationView = NBStationDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(stationView)
        addContraints()
    }
    
    private func addContraints() {
        NSLayoutConstraint.activate([
            stationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stationView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            stationView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            stationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
