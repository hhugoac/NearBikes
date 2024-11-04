//
//  NBStationCollectionViewCellViewModel.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 31/10/24.
//

import Foundation
import MapKit

final class NBStationCollectionViewCellViewModel: Hashable, Equatable {
    
    public let stationName: String
    public let longitude: Double
    public let latitude: Double
    public let freeBikes: Int
    public let emptySlots: Int
    public let distance: Double
    
    
    static func == (lhs: NBStationCollectionViewCellViewModel, rhs: NBStationCollectionViewCellViewModel) -> Bool {
            return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(stationName)
        hasher.combine(longitude)
        hasher.combine(latitude)
        hasher.combine(freeBikes)
        hasher.combine(emptySlots)
    }
    
    init(stationName: String, longitude: Double, latitude: Double, freeBikes: Int, emptySlots: Int,
         myLocation: MKMapPoint) {
        self.stationName = stationName
        self.longitude = longitude
        self.latitude = latitude
        self.freeBikes = freeBikes
        self.emptySlots = emptySlots
        let location = MKMapPoint(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        self.distance = myLocation.distance(to: location) as Double
    }
}
