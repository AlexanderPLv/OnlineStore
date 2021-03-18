//
//  ChangeUserData.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

class ChangeUser {
    let sessionManager: URLSession
    let serializer: DecodableSerializer<EndPoint.ModelType>
    let encoder: ParameterEncoder
    init(
        serializer: DecodableSerializer<EndPoint.ModelType>,
        encoder: ParameterEncoder,
        sessionManager: URLSession) {
        self.encoder = encoder
        self.serializer = serializer
        self.sessionManager = sessionManager
    }
}

extension ChangeUser: AbstractRequestFactory {
    typealias EndPoint = ChangeUserResource
    
    
    func request(withCompletion completion: @escaping (Result<EndPoint.ModelType, NetworkingError>) -> Void) {}
}

extension ChangeUser: ChangeUserFactory {
    func changeUser(userId: Int, username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (Result<EndPoint.ModelType, NetworkingError>) -> Void) {
        let route = ChangeUserResource(userId: userId,
                                      username: username,
                                      password: password,
                                      email: email,
                                      gender: gender,
                                      creditCard: creditCard,
                                      bio: bio)
        request(route, withCompletion: completionHandler)
    }

}
