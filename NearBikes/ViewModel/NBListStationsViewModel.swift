//
//  NBListStationsViewModel.swift
//  NearBikes
//
//  Created by Hugo Alonzo on 30/10/24.
//

import Foundation

final class NBListStationsViewModel: NSObject {
    private var stations: [NBStation] = []
    
    func fetchListStations() {
        let request = NBRequest(endpoint: .networks, pathComponents: ["mibici-guadalajara"])
        NBHttpClient.shared.execute(
            request,
            expecting: NBGetAllBikeStationsResponse.self) {[weak self] result in
                switch result {
                case .success(let response):
                    print(String(describing: response))
                case .failure(let error):
                    print(String(describing: error))
                    break
                }
            }
    }
}
