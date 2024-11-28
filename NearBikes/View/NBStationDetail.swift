//
//  NBStationDetail.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 14/11/24.
//

import UIKit
import MapKit

class NBStationDetail: UIView {
    
    private let viewModel: NBStationCollectionViewCellViewModel
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.backgroundColor = .red
        return mapView
    }()
    
    
    init(frame: CGRect, viewModel: NBStationCollectionViewCellViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(mapView)
        addConstraints()
        configureMap(longitude:viewModel.longitude, latitude: viewModel.latitude)
    }

    required init?(coder: NSCoder) {
        fatalError("Unspoorted view")
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.leftAnchor.constraint(equalTo: leftAnchor),
            mapView.rightAnchor.constraint(equalTo: rightAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.heightAnchor.constraint(equalTo:heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func configureMap(longitude: Double, latitude: Double) {
        // 📝 TODO:  create the route between the 2 points into the map
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            mapView.setRegion(region, animated: false)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            mapView.addAnnotation(annotation)
        }

    public func configure(with viewModel: NBStationCollectionViewCellViewModel) {
            configureMap(longitude: viewModel.longitude, latitude: viewModel.latitude)
    }
    
}
