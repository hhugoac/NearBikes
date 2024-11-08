//
//  NBExtra.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 30/10/24.
//

import Foundation

struct NBExtra: Codable {
    let uid: String
    let renting: Int
    let returning: Int
    let lastUpdated: Int
    let address: String
    let postCode: String?
    let hasEbikes: Bool
    let ebikes: Int
    let normalBikes: Int
    let payment: [String]
    let paymentTerminal: Bool
    let altitude: Double?
    let slots: Int
    let rentalUris: RentalUris
    
    enum CodingKeys: String, CodingKey {
           case uid, renting, returning, address, altitude, slots
           case lastUpdated = "last_updated"
           case postCode = "post_code"
           case hasEbikes = "has_ebikes"
           case ebikes, normalBikes = "normal_bikes"
           case payment, paymentTerminal = "payment-terminal"
           case rentalUris = "rental_uris"
       }
}

struct RentalUris: Codable {
    
}
