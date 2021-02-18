//
//  Auth.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 12.02.2021.
//

import Foundation



class SignIn {
    typealias ModelType = LoginResult
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

extension SignIn: AbstractRequestFactory {
    
    func request(withCompletion completion: @escaping (Result<ModelType, NetworkingError>) -> Void) {
        guard let url = url else { return }
        request(url, withCompletion: completion)
    }
}

extension SignIn: SignInRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (Result<LoginResult, NetworkingError>) -> Void) {
        let resource = SignInResource(login: userName, password: password)
        request(resource.url, withCompletion: completionHandler)
    }
    
}
