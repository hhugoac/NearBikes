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
    public let distanceMessage: String
    public var colorBike: UIColor = UIColor()
    public var colorSlot: UIColor = UIColor()
    //public var placeImageURL: URL?
    
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
        self.distanceMessage = "Within \(self.distance) m"
        self.colorBike = self.calculateColor(with:freeBikes)
        self.colorSlot = self.calculateColor(with: emptySlots)
        //getUrlImage()
    }
    
    private func calculateColor(with number: Int) -> UIColor {
        switch number {
        case 0...1:
            return UIColor(red: 220/255, green: 53/255, blue: 69/255, alpha: 1)
        case 2...5:
            return UIColor(red: 241/255, green: 196/255, blue: 15/255, alpha: 1)
        default:
            return UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
        }
    }
    
    /*private func getUrlImage() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        let location = "\(self.latitude),\(self.longitude)"
        let request = NBFSQRequest(
            endpoint: .places,
            pathComponents: ["search"],
            queryParameter: [URLQueryItem(name: "ll", value: location),
                             URLQueryItem(name: "limit", value: "4")]
        )
        
        
        NBFSQHttpClient.shared.execute(request, expecting: NBFSQResponse.self) { [weak self] result in
            switch result {
            case .success(let response):
                let fsqID = response.results.first?.fsqID ?? ""
                
                let request2 = NBFSQRequest(
                    endpoint: .places,
                    pathComponents: [fsqID, "photos"],
                    queryParameter: [URLQueryItem(name: "limit", value: "4")]
                )
                
                NBFSQHttpClient.shared.execute(request2, expecting: [NBFSQImageData].self) { [weak self] result in
                    switch result {
                    case .success(let response):
                        /// build photo url
                        guard let firstPhotoInfo = response.first else { return }
                        self?.placeImageURL = URL(string: firstPhotoInfo.prefix + "original" + firstPhotoInfo.suffix)
                    case .failure(let error):
                        print("🐞 \(String(describing: error))")
                    }
                }
            case .failure:
                print("No photos")
            }
            dispatchGroup.leave()
        }
        dispatchGroup.wait(timeout: .now() + 0.01)
        dispatchGroup.notify(queue: .main) {
            if let placeImageURL = self.placeImageURL {
                print("🚩🚩🚩 \(placeImageURL.absoluteString)")
            } else {
                print("🚩🚩🚩 no values")
            }
        }
    }*/
    
    func fetchImage(url: URL?,completion: @escaping (Result<Data, Error>)-> Void) {
        guard let url = url else {
            
            completion(.failure(URLError(.badURL)))
            return
        }
        NBFSQImageLoader.shared.downloadImage(url, completion: completion)
    }
}
