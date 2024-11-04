//
//  NBStationCollectionViewCellViewModel.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 31/10/24.
//

import Foundation

final class NBStationCollectionViewCellViewModel: Hashable, Equatable {
    
    public let stationName: String
    public let longitude: Double
    public let latitude: Double
    
    static func == (lhs: NBStationCollectionViewCellViewModel, rhs: NBStationCollectionViewCellViewModel) -> Bool {
            return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(stationName)
        hasher.combine(longitude)
        hasher.combine(latitude)
    }
    
    init(stationName: String, longitude: Double, latitude: Double) {
        self.stationName = stationName
        self.longitude = longitude
        self.latitude = latitude
    }
}
