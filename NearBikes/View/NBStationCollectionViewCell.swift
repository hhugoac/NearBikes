//
//  NBStationCollectionViewCell.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 31/10/24.
//

import UIKit

class NBStationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NBStationCollectionViewCell"
    
    private let mapContainer: UIView = {
        let container = UIView(frame: .zero)
        container.backgroundColor = .red
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let mapImage: UIImageView = {
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
        backgroundColor = .red
        addSubview(mapContainer)
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
            mapContainer.heightAnchor.constraint(equalTo: contentView.heightAnchor)
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
        mapImage.image = nil
    }
    
    public func configure(with viewModel: NBStationCollectionViewCellViewModel) {
            nameLabel.text = viewModel.stationName
        mapImage.image = UIImage(named: "RectangleMap")
    }
}
