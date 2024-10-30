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
    let postCode: String
    let hasEbikes: Bool
    let ebikes: Int
    let normalBikes: Int
    let payment: [String]
    let paymentTerminal: Bool
    let altitude: Double?
    let slots: Int
}
