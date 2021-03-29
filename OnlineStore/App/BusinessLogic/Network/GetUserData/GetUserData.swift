//
//  GetUserData.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 26.03.2021.
//

import Foundation

class GetUserData {
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

extension GetUserData: AbstractRequestFactory {
    typealias EndPoint = UserDataResource
    func request(withCompletion completion: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {}
}

extension GetUserData: GetUserDataFactory {
    func getUserData(userId: Int, token: String, completionHandler: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {
        let route = UserDataResource(userId: userId, token: token)
        request(route, withCompletion: completionHandler)
    }

}
