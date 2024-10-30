//
//  NBGetAllBikeStationsResponse.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 30/10/24.
//

import Foundation

struct NBGetAllBikeStationsResponse: Codable {
    struct Network: Codable {
        let id: String
        let name: String
        let loactions: NBLocation
        let href: String
        let company: [String]
        let gbfsHref: String
        let stations: [NBStation]
    }
}
