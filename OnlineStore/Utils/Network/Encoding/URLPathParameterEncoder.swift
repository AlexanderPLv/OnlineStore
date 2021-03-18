//
//  URLParameterEncoder.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

public struct URLPathParameterEncoder: ParameterEncoder {
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        guard var url = urlRequest.url
              else { throw NetworkingError.missingURL }
            
            for (_ ,value) in parameters {
                let pathComponent = String("\(value)")
                url.appendPathComponent(pathComponent)
            }
        urlRequest.url = url
    }
}
