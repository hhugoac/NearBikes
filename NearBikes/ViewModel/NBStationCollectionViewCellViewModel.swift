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
    public var placeImageURL: URL?
    
    
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
        getUrlImage()
    }
    
    private func getUrlImage() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        let location = "\(self.latitude),\(self.longitude)"
        let request = NBFSQRequest(
            endpoint: .places,
            pathComponents: ["search"],
            queryParameter: [URLQueryItem(name: "ll", value: location),
                             URLQueryItem(name: "limit", value: "4")]
        )
    }
    
    func fetchImage(url: URL?,completion: @escaping (Result<Data, Error>)-> Void) {
        guard let url = url else {
            
            completion(.failure(URLError(.badURL)))
            return
        }
        NBFSQImageLoader.shared.downloadImage(url, completion: completion)
    }
}
