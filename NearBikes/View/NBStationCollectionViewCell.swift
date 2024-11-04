//
//  NBStationCollectionViewCell.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 31/10/24.
//

import UIKit
import MapKit

class NBStationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NBStationCollectionViewCell"
    
    private let mapContainer: UIView = {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .systemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mapContainer)
        contentView.addSubview(infoStackView)
        infoStackView.addSubview(nameLabel)
        
        mapContainer.addSubview(mapView)
        addConstraints()
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            mapContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            mapContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mapContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mapContainer.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            
            infoStackView.topAnchor.constraint(equalTo: mapContainer.bottomAnchor),
            infoStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            infoStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            infoStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            
            mapView.topAnchor.constraint(equalTo: mapContainer.topAnchor),
            mapView.leftAnchor.constraint(equalTo: mapContainer.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: mapContainer.rightAnchor),
            mapView.bottomAnchor.constraint(equalTo: mapContainer.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: infoStackView.topAnchor, constant: 4),
            nameLabel.leftAnchor.constraint(equalTo: infoStackView.leftAnchor, constant: 4),
            
        ])
    }
    
    private func setupLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.secondaryLabel.cgColor
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }
    
    private func configureMap(longitude: Double, latitude: Double) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(region, animated: false)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }
    
    public func configure(with viewModel: NBStationCollectionViewCellViewModel) {
        nameLabel.text = viewModel.stationName
        configureMap(longitude: viewModel.longitude, latitude: viewModel.latitude)
    }
}
