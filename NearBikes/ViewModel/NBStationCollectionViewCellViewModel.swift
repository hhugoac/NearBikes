//
//  NBStationCollectionViewCellViewModel.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 31/10/24.
//

import Foundation

final class NBStationCollectionViewCellViewModel: Hashable, Equatable {
    
    public let stationName: String
    
    static func == (lhs: NBStationCollectionViewCellViewModel, rhs: NBStationCollectionViewCellViewModel) -> Bool {
            return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(stationName)
    }
    
    init(stationName: String) {
        self.stationName = stationName
    }
}
