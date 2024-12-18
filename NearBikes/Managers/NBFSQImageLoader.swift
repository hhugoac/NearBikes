//
//  NBFSQImageLoader.swift
//  NearBikes
//
//  Created by Hector Hugo Alonzo Cortez on 08/11/24.
//

import Foundation

class NBFSQImageLoader {
    static let shared = NBFSQImageLoader()
    private var imageDataCache = NSCache<NSString, NSData>()
    
    private init () {}
    
    public func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>)-> Void) {
        let key = url.absoluteString as NSString
        
        if let data = imageDataCache.object(forKey: key) {
            completion(.success(data as Data)) // NSData == Data | NSString == String
            return
        }
        
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            ///Save in the cache
            let key = url.absoluteString as NSString
            let value = data as NSData
            self?.imageDataCache.setObject(value, forKey: key)
            
            completion(.success(data))
        }
        task.resume()
    }
}
