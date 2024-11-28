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
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(red: 39/255, green: 105/255, blue: 71/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bikeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bicycle")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let freeBikesLabel: UILabel = {
        let label = UILabel()
        label.text = "Bikes: "
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let freeBikesValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bikeStack : UIStackView = {
        let stack = UIStackView()
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 4
        stack.layoutMargins = .init(top: 8, left: 8, bottom: 8, right: 8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 8
        return stack
    }()
    
    private let slotStack : UIStackView = {
        let stack = UIStackView()
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 4
        stack.layoutMargins = .init(top: 8, left: 8, bottom: 8, right: 8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 8
        return stack
    }()
    
    private let slotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "dock.arrow.down.rectangle")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emptySlotsLabel: UILabel = {
        let label = UILabel()
        label.text = "Slots: "
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emptySlotsValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .systemBlue
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
        
        contentView.addSubview(bikeStack)
        bikeStack.addArrangedSubview(bikeImageView)
        bikeStack.addArrangedSubview(freeBikesLabel)
        bikeStack.addArrangedSubview(freeBikesValueLabel)
        
        
        contentView.addSubview(slotStack)
         slotStack.addArrangedSubview(slotImageView)
         slotStack.addArrangedSubview(emptySlotsLabel)
        slotStack.addArrangedSubview(emptySlotsValueLabel)
    
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
            
            bikeStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2 * padding),
            bikeStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
             
            slotStack.topAnchor.constraint(equalTo: freeBikesLabel.bottomAnchor, constant: padding),
            slotStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
            
            annotationImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            annotationImageView.rightAnchor.constraint(equalTo: distanceLabel.leftAnchor, constant: -padding / 2),
            
            distanceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            distanceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding),
        ])
    }
    
    private func setupLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.secondaryLabel.cgColor
        contentView.layer.shadowOffset = CGSize(width: 2, height: 2)
        contentView.layer.shadowOpacity = 1
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = 8
        
        gradientLayer.colors = [UIColor(red: 176/255, green: 216/255, blue: 179/255, alpha: 1).cgColor,    // Muted sage
                                UIColor(red: 233/255, green: 247/255, blue: 230/255, alpha: 1).cgColor
                                ]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        gradientLayer.frame = contentView.frame
        contentView.layer.insertSublayer(gradientLayer, at: 0)
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
        slotStack.backgroundColor = viewModel.colorSlot
        
        freeBikesValueLabel.text = "\(viewModel.freeBikes)"
        bikeStack.backgroundColor = viewModel.colorBike
        
        distanceLabel.text = viewModel.distanceMessage
    }
}
