//
//  Logout.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

class Logout {
    let sessionManager: URLSession
    let serializer: DecodableSerializer<EndPoint.ModelType>
    let encoder: ParameterEncoder
    init(
        serializer: DecodableSerializer<EndPoint.ModelType>,
        encoder: ParameterEncoder,
        sessionManager: URLSession) {
        self.serializer = serializer
        self.encoder = encoder
        self.sessionManager = sessionManager
    }
}

extension Logout: AbstractRequestFactory {
    typealias EndPoint = LogoutResouce
    func request(withCompletion completion: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {}
}

extension Logout: LogoutRequestFactory {
    func logout(userId: Int, completion: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {
        let route = LogoutResouce(userId: userId)
        request(route, withCompletion: completion)
    }
    
   
    
}
