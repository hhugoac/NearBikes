//
//  NFSQRequest.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 05/11/24.
//

import Foundation

class NBFSQRequest {
    
/// API Constants
private struct Constants {
    static let baseUrl = "https://api.foursquare.com/v3"
}

/// Desired endpoint
let endpoint: NBEndpoint

/// Path components for API, if any
private let pathComponents: [String]

/// Query components for API, if any
private let queryParameter: [URLQueryItem]

/// Constructing url for the api request in string format
private var urlString: String {
    var string = Constants.baseUrl
    string += "/"
    string += endpoint.rawValue

    if !pathComponents.isEmpty {
        pathComponents.forEach {
            string += "/\($0)"
        }
    }

    if !queryParameter.isEmpty {
        string += "?"
        let argmentString = queryParameter.compactMap({
            guard let value = $0.value else { return nil }
            return "\($0.name)=\(value)"
        }).joined(separator: "&")
        string += argmentString
    }
    return string
}

/// Computed & construct API url
public var url: URL? {
    return URL(string: urlString)
}

/// Desired http method
public let httpMethod = "GET"

// MARK: - Public

/// Consturct request
/// - Parameters:
///   - endpoint: Target endpoint
///   - pathComponents: Collection of Path components
///   - queryParameter: Collection of query parameters
init(
    endpoint: NBEndpoint,
    pathComponents: [String] = [],
    queryParameter: [URLQueryItem] = []
) {
    self.endpoint = endpoint
    self.pathComponents = pathComponents
    self.queryParameter = queryParameter
}

convenience init?(url: URL) {
    let string = url.absoluteString
    if !string.contains(Constants.baseUrl) {
        return nil
    }
    let trimmed = string.replacingOccurrences(
        of: Constants.baseUrl + "/", with: "")
    if trimmed.contains("/") {
        let components = trimmed.components(separatedBy: "/")
        if !components.isEmpty {
            let endPointString = components[0]
            var pathComponents: [String] = []
            if components.count > 1 {
                pathComponents = components
                pathComponents.removeFirst()
            }
            if let rmEndpoint = NBEndpoint(rawValue: endPointString) {
                self.init(
                    endpoint: rmEndpoint, pathComponents: pathComponents)
                return
            }
        }
    } else if trimmed.contains("?") {
        let components = trimmed.components(separatedBy: "?")
        if !components.isEmpty, components.count >= 2 {
            let endPointString = components[0]
            let queryItemsString = components[1]
            let queryItems: [URLQueryItem] = queryItemsString.components(
                separatedBy: "&"
            ).compactMap({
                guard $0.contains("=") else {
                    return nil
                }
                let parts = $0.components(separatedBy: "=")
                return URLQueryItem(name: parts[0], value: parts[1])
            })
            if let rmEndpoint = NBEndpoint(rawValue: endPointString) {
                self.init(endpoint: rmEndpoint, queryParameter: queryItems)
                return
            }
        }
    }
    return nil
}
}

extension NBFSQRequest {
    static let placePhoto = NBFSQRequest(endpoint: .places)
}
