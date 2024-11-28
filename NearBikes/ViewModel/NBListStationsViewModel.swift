//
//  NBListStationsViewModel.swift
//  NearBikes
//
//  Created by Hugo Alonzo on 30/10/24.
//

import UIKit
import MapKit

protocol NBListStationsViewModelProtocol: AnyObject {
    func loadStations()
    func didSelectedStation(_ viewModel: NBStationCollectionViewCellViewModel)
}

final class NBListStationsViewModel: NSObject {
    private var cellViewModels: [NBStationCollectionViewCellViewModel] = []
    private var stations: [NBStation] = [] {
        didSet {
            for station in stations {
                let viewModel = NBStationCollectionViewCellViewModel(
                    stationName: station.name,
                    longitude: station.longitude,
                    latitude: station.latitude,
                    freeBikes: station.freeBikes,
                    emptySlots: station.emptySlots,
                    myLocation: self.myLocation
                )
                if !cellViewModels.contains(viewModel) {
                    cellViewModels.append(viewModel)
                }
            }
            cellViewModels = cellViewModels.sorted{ $0.distance < $1.distance}
        }
    }
    
    public weak var delegate: NBListStationsViewModelProtocol?
    
    let myLocation: MKMapPoint = MKMapPoint(CLLocationCoordinate2D(latitude: 20.680551, longitude: -103.359311))
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let station = stations[indexPath.row]
        let vm = cellViewModels[indexPath.row]
        delegate?.didSelectedStation(vm)
    }
}
