//
//  Network.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 31/10/24.
//


struct NBNetwork: Codable {
        let id: String
        let name: String
        let location: NBLocation
        let href: String
        let company: [String]
        let gbfsHref: String
        let stations: [NBStation]
    
    enum CodingKeys: String, CodingKey {
            case id, name, location, href, company, stations
            case gbfsHref = "gbfs_href"
        }
}
