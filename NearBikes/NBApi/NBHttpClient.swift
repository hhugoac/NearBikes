//
//  NBHttpClient.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 30/10/24.
//

import Foundation


final class NBHttpClient {
    /// Shared singleton instance
    static let shared = NBHttpClient()

    
    ///Privatized constructor
    private init() {}
    
    enum NBHttpClientError : Error{
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick And Morty API call
    /// - Parameters:
    ///   - request: Resquest instance
    ///   - type: The type of object expected to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: NBRequest,
        expecting type:T.Type,
        completion: @escaping (Result<T,Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(NBHttpClientError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(NBHttpClientError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - private
    private func request(from rmRequest: NBRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = request.httpMethod
        return request
    }
}

