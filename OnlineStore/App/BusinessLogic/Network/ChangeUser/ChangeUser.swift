//
//  ChangeUserData.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

//class ChangeUser {
//    typealias ModelType = IsSuccess
//    let sessionManager: URLSession
//    let serializer: DecodableSerializer<ModelType>
//    var url: URL?
//    init(
//        serializer: DecodableSerializer<ModelType>,
//        sessionManager: URLSession) {
//        self.serializer = serializer
//        self.sessionManager = sessionManager
//    }
//}
//
//extension ChangeUser: AbstractRequestFactory {
//    
//    func request(withCompletion completion: @escaping (Result<ModelType, NetworkingError>) -> Void) {
//        guard let url = url else { return }
//        request(url, withCompletion: completion)
//    }
//}
//
//extension ChangeUser: ChangeUserFactory {
//    func changeUser(idUser: String, username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (Result<IsSuccess, NetworkingError>) -> Void) {
//        let resource = ChangeUserResource(idUser: idUser,
//                                      username: username,
//                                      password: password,
//                                      email: email,
//                                      gender: gender,
//                                      creditCard: creditCard,
//                                      bio: bio)
//        request(resource.url, withCompletion: completionHandler)
//    }
//
//}
