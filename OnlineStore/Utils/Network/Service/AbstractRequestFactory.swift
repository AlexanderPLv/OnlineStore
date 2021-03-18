//
//  AbstractRequestFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 16.02.2021.
//

import Foundation

protocol AbstractRequestFactory: AnyObject {
    associatedtype EndPoint: EndPointType
    
    var sessionManager      : URLSession { get }
    var serializer          : DecodableSerializer<EndPoint.ModelType> { get }
    var encoder             : ParameterEncoder { get }
    func request(withCompletion completion: @escaping (Result<EndPoint.ModelType, NetworkingError>) -> Void)
}

extension AbstractRequestFactory {
    
    func request(_ route: EndPoint,
                 withCompletion completion: @escaping (Result<EndPoint.ModelType, NetworkingError>) -> Void) {
        
        do {
            let request = try self.buildRequest(from: route)
            print(request.url)
            let task = sessionManager.dataTask(with: request, completionHandler: {
                (data: Data?, response: URLResponse?, error: Error?) -> Void in
                       if error != nil {
                           completion(.failure(NetworkingError.invalidRequest))
                       }
                       guard let data = data else {
                           completion(.failure(NetworkingError.badData))
                           return
                       }
                let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                print(json)
                do {
                         let value = try self.serializer.decode(data)
                           completion(.success(value))
                       } catch {
                           completion(.failure(NetworkingError.parsingError))
                       }
                   })
                   task.resume()
        } catch {
            completion(.failure(NetworkingError.invalidRequest))
        }
        }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.url,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            try encoder.encode(urlRequest: &request, with: route.parameters)
        } catch {
            throw NetworkingError.encodingFailed
        }
        
        return request
    }
    
    
    }
