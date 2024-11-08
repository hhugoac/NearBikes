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
    
    //private let mapView: MKMapView = {
    //    let mapView = MKMapView()
    //    mapView.translatesAutoresizingMaskIntoConstraints = false
    //    return mapView
    //}()
    
    private let imagePlaceView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    private let freeBikesLabel: UILabel = {
        let label = UILabel()
        label.text = "Bikes available: "
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let freeBikesImage: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emptySlotsLabel: UILabel = {
        let label = UILabel()
        label.text = "Slots available: "
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emptySlotsImage: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var annotation :[MKPointAnnotation] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mapContainer)
        contentView.addSubview(infoStackView)
        
        infoStackView.addSubview(nameLabel)
        infoStackView.addSubview(freeBikesLabel)
        infoStackView.addSubview(emptySlotsLabel)
        infoStackView.addSubview(freeBikesImage)
        infoStackView.addSubview(emptySlotsImage)
        infoStackView.addSubview(distanceLabel)
        
        mapContainer.addSubview(imagePlaceView)
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
            
            imagePlaceView.topAnchor.constraint(equalTo: mapContainer.topAnchor),
            imagePlaceView.leftAnchor.constraint(equalTo: mapContainer.leftAnchor),
            imagePlaceView.rightAnchor.constraint(equalTo: mapContainer.rightAnchor),
            imagePlaceView.bottomAnchor.constraint(equalTo: mapContainer.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: infoStackView.topAnchor, constant: 4),
            nameLabel.leftAnchor.constraint(equalTo: infoStackView.leftAnchor, constant: 4),
            
            freeBikesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            freeBikesLabel.leftAnchor.constraint(equalTo: infoStackView.leftAnchor, constant: 4),
           
            freeBikesImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            freeBikesImage.leftAnchor.constraint(equalTo: freeBikesLabel.rightAnchor, constant: 4),
            
            emptySlotsLabel.topAnchor.constraint(equalTo: freeBikesLabel.bottomAnchor, constant: 4),
            emptySlotsLabel.leftAnchor.constraint(equalTo: infoStackView.leftAnchor, constant: 4),
            
            emptySlotsImage.topAnchor.constraint(equalTo: freeBikesLabel.bottomAnchor, constant: 4),
            emptySlotsImage.leftAnchor.constraint(equalTo: emptySlotsLabel.rightAnchor, constant: 4),
            
            distanceLabel.centerYAnchor.constraint(equalTo: infoStackView.centerYAnchor),
            distanceLabel.rightAnchor.constraint(equalTo: infoStackView.rightAnchor, constant: -4),
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
        //mapView.setRegion(region, animated: false)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        self.annotation.append(annotation)
        //mapView.addAnnotation(annotation)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        //mapView.removeAnnotations(self.annotation)
        emptySlotsImage.text = nil
        freeBikesImage.text = nil
        distanceLabel.text = nil
        imagePlaceView.image = nil
    }
    
    public func configure(with viewModel: NBStationCollectionViewCellViewModel) {
        nameLabel.text = viewModel.stationName
        emptySlotsImage.text = "\(viewModel.emptySlots)"
        freeBikesImage.text = "\(viewModel.freeBikes)"
        distanceLabel.text = "\(viewModel.distance) m"
        //configureMap(longitude: viewModel.longitude, latitude: viewModel.latitude)
        let url = viewModel.placeImageURL
        //let url = URL(string: "https://fastly.4sqi.net/img/general/original/64437825_9Xiwwvw38XbirQO7LVIs7WVw60jlIHXDd9zXkb35AGw.jpg")
        viewModel.fetchImage(url: url,completion: {[weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imagePlaceView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                
            }
        })
    }
}
