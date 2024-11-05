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
    public let distance: Int
    
    
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
        self.distance = Int(myLocation.distance(to: location).rounded()) 
    }
    
      func getImageFromLocations() {
          let location = "\(latitude),\(longitude)"
          let request = NBFSQRequest(
            endpoint: .places,
            pathComponents: ["search"],
            queryParameter: [URLQueryItem(name: "ll", value: location)]
          )
        
          NBFSQHttpClient.shared.execute(request, expecting: String.self) { [weak self] result in
              switch result {
              case .success(let result):
                  print(result)
              case .failure(let error):
                  print(error)
              }
          }
    }
}
