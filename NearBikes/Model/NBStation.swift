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
}
