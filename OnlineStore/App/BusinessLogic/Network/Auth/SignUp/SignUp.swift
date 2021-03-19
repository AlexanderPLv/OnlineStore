//
//  SignUp.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.02.2021.
//

import Foundation

class SignUp {
    
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

extension SignUp: AbstractRequestFactory {
    typealias EndPoint = SignUpResource
    func request(withCompletion completion: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) { }
}

extension SignUp: SignUpRequestFactory {
    func signUp(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {
        
        let route = SignUpResource(userId: userId, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)

        request(route, withCompletion: completionHandler)
    }

    
    
}
