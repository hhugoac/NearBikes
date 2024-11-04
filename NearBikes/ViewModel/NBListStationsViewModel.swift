//
//  NBListStationsViewModel.swift
//  NearBikes
//
//  Created by Hugo Alonzo on 30/10/24.
//

import UIKit

protocol NBListStationsViewModelProtocol: AnyObject {
    func loadStations()
}

final class NBListStationsViewModel: NSObject {
    private var cellViewModels: [NBStationCollectionViewCellViewModel] = []
    private var stations: [NBStation] = [] {
        didSet {
            for station in stations {
                let viewModel = NBStationCollectionViewCellViewModel(
                    stationName: station.name,
                    longitude: station.longitude,
                    latitude: station.latitude
                )
                if !cellViewModels.contains(viewModel) {
                    cellViewModels.append(viewModel)
                }
            }
        }
    }
    
    public weak var delegate: NBListStationsViewModelProtocol?
    
    func fetchListStations() {
        let request = NBRequest(endpoint: .networks, pathComponents: ["mibici-guadalajara"])
        NBHttpClient.shared.execute(
            request,
            expecting: NBGetAllBikeStationsResponse.self) {[weak self] result in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self?.stations = response.network.stations
                        self?.delegate?.loadStations()
                    }
                case .failure(let error):
                    break
                }
            }
    }
}

extension NBListStationsViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: NBStationCollectionViewCell.identifier,
            for: indexPath) as? NBStationCollectionViewCell
        else {
            fatalError("Unsupported cell type")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let width  = (bounds.width - 30)
        
        return CGSize(width: width, height: width / 2)
    }
}
