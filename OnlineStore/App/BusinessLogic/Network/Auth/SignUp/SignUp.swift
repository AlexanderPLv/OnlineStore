//
//  SignUp.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.02.2021.
//

import Foundation

class SignUp {
    typealias ModelType = RegisterUser
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

extension SignUp: AbstractRequestFactory {
    
    func request(withCompletion completion: @escaping (Result<ModelType, NetworkingError>) -> Void) {
        guard let url = url else { return }
        request(url, withCompletion: completion)
    }
}

extension SignUp: SignUpRequestFactory {
    func signUp(idUser: String, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (Result<RegisterUser, NetworkingError>) -> Void) {
        let resource = SignUpResource(idUser: idUser,
                                      userName: userName,
                                      password: password,
                                      email: email,
                                      gender: gender,
                                      creditCard: creditCard,
                                      bio: bio)
        request(resource.url, withCompletion: completionHandler)
    }

}
