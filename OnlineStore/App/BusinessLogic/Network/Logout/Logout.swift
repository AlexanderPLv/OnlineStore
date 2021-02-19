//
//  Logout.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

class Logout {
    typealias ModelType = IsSuccess
    let sessionManager: URLSession
    let serializer: DecodableSerializer<ModelType>
    var url: URL?
    init(
        serializer: DecodableSerializer<ModelType>,
        sessionManager: URLSession) {
        self.serializer = serializer
        self.sessionManager = sessionManager
    }
}

extension Logout: AbstractRequestFactory {
    
    func request(withCompletion completion: @escaping (Result<ModelType, NetworkingError>) -> Void) {
        guard let url = url else { return }
        request(url, withCompletion: completion)
    }
}

extension Logout: LogoutRequestFactory {
    func logout(userId: String, completion: @escaping (Result<IsSuccess, NetworkingError>) -> Void) {
        let resource = LogoutResouce(userId: userId)
        request(resource.url, withCompletion: completion)
    }
    
   
    
}
