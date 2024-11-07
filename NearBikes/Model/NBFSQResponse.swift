//
//  Response.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 06/11/24.
//


import Foundation

struct NBFSQResponse: Codable {
    let results: [NBFSQResult]
}

struct NBFSQResult: Codable {
    let fsqID: String
    let categories: [NBFSQCategory]
    let chains: [NBFSQChain]
    let closedBucket: String
    let distance: Int
    let geocodes: NBFSQGeocodes
    let link: String
    let location: NBFSQLocation
    let name: String
    let relatedPlaces: NBFSQRelatedPlaces
    let timezone: String

    enum CodingKeys: String, CodingKey {
        case fsqID = "fsq_id"
        case categories, chains
        case closedBucket = "closed_bucket"
        case distance, geocodes, link, location, name
        case relatedPlaces = "related_places"
        case timezone
    }
}

struct NBFSQCategory: Codable {
    let id: Int
    let name: String
    let shortName: String
    let pluralName: String
    let icon: NBFSQIcon

    enum CodingKeys: String, CodingKey {
        case id, name
        case shortName = "short_name"
        case pluralName = "plural_name"
        case icon
    }
}

struct NBFSQIcon: Codable {
    let prefix: String
    let suffix: String
}

struct NBFSQChain: Codable {
    // Define properties if needed
}

struct NBFSQGeocodes: Codable {
    let main: NBFSQCoordinate
    let roof: NBFSQCoordinate?
    let dropOff: NBFSQCoordinate?

    enum CodingKeys: String, CodingKey {
        case main, roof
        case dropOff = "drop_off"
    }
}

struct NBFSQCoordinate: Codable {
    let latitude: Double
    let longitude: Double
}

struct NBFSQLocation: Codable {
    let address: String
    let country: String
    let crossStreet: String
    let formattedAddress: String
    let locality: String
    let postcode: String
    let region: String

    enum CodingKeys: String, CodingKey {
        case address, country
        case crossStreet = "cross_street"
        case formattedAddress = "formatted_address"
        case locality, postcode, region
    }
}

struct NBFSQRelatedPlaces: Codable {
    let parent: NBFSQParent?
    let children: [NBFSQChild]?
}

struct NBFSQParent: Codable {
    let fsqID: String
    let categories: [NBFSQCategory]
    let name: String

    enum CodingKeys: String, CodingKey {
        case fsqID = "fsq_id"
        case categories, name
    }
}

struct NBFSQChild: Codable {
    let fsqID: String
    let categories: [NBFSQCategory]
    let name: String

    enum CodingKeys: String, CodingKey {
        case fsqID = "fsq_id"
        case categories, name
    }
}
