//
//  NBStationViewController.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 14/11/24.
//

import UIKit

class NBStationViewController: UIViewController {

    let viewModel: NBStationCollectionViewCellViewModel
    let stationView: NBStationDetail
    
    
    // MARK: - Init
    init(viewModel: NBStationCollectionViewCellViewModel) {
        self.viewModel = viewModel
        self.stationView = NBStationDetail(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
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
