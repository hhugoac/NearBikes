//
//  NBStation.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 30/10/24.
//

import Foundation

struct NBStation: Codable {
    let id: String
        let name: String
        let latitude: Double
        let longitude: Double
        let timestamp: String
        let freeBikes: Int
        let emptySlots: Int
        let extra: NBExtra
    
    enum CodingKeys: String, CodingKey {
            case id, name, latitude, longitude, timestamp
            case freeBikes = "free_bikes"
            case emptySlots = "empty_slots"
            case extra
        }
}
