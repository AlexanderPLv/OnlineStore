//
//  Auth.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 12.02.2021.
//

import Foundation



class SignIn {
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

extension SignIn: AbstractRequestFactory {
    
    typealias EndPoint = SignInResource
    
    
    func request(withCompletion completion: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {}
}

extension SignIn: SignInRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {
        let route = SignInResource(login: userName, password: password)
        request(route, withCompletion: completionHandler)
    }
    
}
