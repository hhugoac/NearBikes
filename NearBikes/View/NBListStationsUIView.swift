//
//  NBListStationsUIView.swift
//  NearBikes
//
//  Created by Hugo Alonzo on 30/10/24.
//

import UIKit

class NBListStationsUIView: UIView, NBListStationsViewModelProtocol {
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            NBStationCollectionViewCell.self,
            forCellWithReuseIdentifier: NBStationCollectionViewCell.identifier
        )
        
        return collectionView
    }()
    
    let viewModel = NBListStationsViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewModel.fetchListStations()
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        viewModel.delegate = self
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    func loadStations() {
        collectionView.reloadData()
    }
}

