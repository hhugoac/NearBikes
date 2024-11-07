//
//  NSFSQHttpClient.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 05/11/24.
//

import Foundation

final class NBFSQHttpClient {
    /// Shared singleton instance
    static let shared = NBFSQHttpClient()
    
    ///Privatized constructor
    private init() {}
    
    enum NBFSQHttpClientError : Error{
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick And Morty API call
    /// - Parameters:
    ///   - request: Resquest instance
    ///   - type: The type of object expected to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: NBFSQRequest,
        expecting type:T.Type,
        completion: @escaping (Result<T,Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(NBFSQHttpClientError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(NBFSQHttpClientError.failedToGetData))
                return
            }
            
            do {
                print(String(describing: data))
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - private
    private func request(from rmRequest: NBFSQRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = request.httpMethod
        request.setValue("Authorization", forHTTPHeaderField: "fsq3YS1lINUyEL+lpNMogu81Gyt0sPOVNuPn+emCIwb9Zgs=")
        request.setValue("accept", forHTTPHeaderField: "application/json")
        return request
    }
}


