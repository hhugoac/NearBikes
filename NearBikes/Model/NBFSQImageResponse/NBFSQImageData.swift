//
//  NBFSQImageData.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 08/11/24.
//

import Foundation

struct NBFSQImageData: Codable {
    let id: String
    let createdAt: Date
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case prefix
        case suffix
        case width
        case height
    }
}
