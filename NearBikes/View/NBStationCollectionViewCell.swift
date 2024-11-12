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
    

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bikeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bicycle")?.withTintColor(UIColor.red)
      
        
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let freeBikesLabel: UILabel = {
        let label = UILabel()
        label.text = "Bikes available: "
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let freeBikesValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let slotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bicycle.circle.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emptySlotsLabel: UILabel = {
        let label = UILabel()
        label.text = "Slots available: "
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emptySlotsValueLabel: UILabel = {
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
    
    
    private let annotationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    var annotation :[MKPointAnnotation] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(nameLabel)
        contentView.addSubview(bikeImageView)
        contentView.addSubview(freeBikesLabel)
         contentView.addSubview(freeBikesValueLabel)
         contentView.addSubview(slotImageView)
         contentView.addSubview(emptySlotsLabel)
         contentView.addSubview(emptySlotsValueLabel)
         contentView.addSubview(distanceLabel)
        contentView.addSubview(annotationImageView)
        addConstraints()
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addConstraints() {
        let padding: CGFloat = 16
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            bikeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bikeImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
            
            freeBikesLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            freeBikesLabel.leftAnchor.constraint(equalTo: bikeImageView.rightAnchor, constant: padding / 2),
           
            freeBikesValueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            freeBikesValueLabel.leftAnchor.constraint(equalTo: freeBikesLabel.rightAnchor, constant: padding),
            
            slotImageView.topAnchor.constraint(equalTo: freeBikesLabel.bottomAnchor, constant: padding),
            slotImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
            
            emptySlotsLabel.topAnchor.constraint(equalTo: freeBikesLabel.bottomAnchor, constant: padding),
            emptySlotsLabel.leftAnchor.constraint(equalTo: slotImageView.rightAnchor, constant: padding / 2),
            
            emptySlotsValueLabel.topAnchor.constraint(equalTo: freeBikesLabel.bottomAnchor, constant: padding),
            emptySlotsValueLabel.leftAnchor.constraint(equalTo: emptySlotsLabel.rightAnchor, constant: padding),
            
            annotationImageView.topAnchor.constraint(equalTo: emptySlotsValueLabel.bottomAnchor, constant: padding),
            annotationImageView.rightAnchor.constraint(equalTo: distanceLabel.leftAnchor, constant: -padding / 2),
            
            distanceLabel.topAnchor.constraint(equalTo: emptySlotsValueLabel.bottomAnchor, constant: padding),
            distanceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding),
        ])
    }
    
    private func setupLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.secondaryLabel.cgColor
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        emptySlotsValueLabel.text = nil
        freeBikesValueLabel.text = nil
        distanceLabel.text = nil
    }
    
    public func configure(with viewModel: NBStationCollectionViewCellViewModel) {
        nameLabel.text = viewModel.stationName
        emptySlotsValueLabel.text = "\(viewModel.emptySlots)"
        freeBikesValueLabel.text = "\(viewModel.freeBikes)"
        distanceLabel.text = "Distance from me: \(viewModel.distance) m"
    }
}
