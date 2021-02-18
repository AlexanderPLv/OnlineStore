//
//  AbstractRequestFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 16.02.2021.
//

import Foundation

protocol AbstractRequestFactory: AnyObject {
    associatedtype ModelType: Decodable
    var sessionManager      : URLSession { get }
    var serializer          : DecodableSerializer<ModelType> { get }
    func request(withCompletion completion: @escaping (Result<ModelType, NetworkingError>) -> Void)
}

extension AbstractRequestFactory {
    
    func request(_ url: URL, withCompletion completion: @escaping (Result<ModelType, NetworkingError>) -> Void) {
        let task = sessionManager.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if error != nil {
                completion(.failure(NetworkingError.invalidRequest))
            }
            guard let data = data else {
                completion(.failure(NetworkingError.badData))
                return
            }
            do {
              let value = try self.serializer.decode(data)
                completion(.success(value))
            } catch {
                completion(.failure(NetworkingError.parsingError))
            }
        })
        task.resume()
        }
    }
