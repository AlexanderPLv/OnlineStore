//
//  ChangeUserResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

struct ChangeUserResource: RequestRouter {
    let host: BaseURL = .apiRequest
    let method: Path = .changeUserData
    let idUser: String
    let username: String
    let password: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
    var fields: [URLQueryItem] {
        [
            URLQueryItem(name: "id_user", value: idUser),
            URLQueryItem(name: "username", value: username),
            URLQueryItem(name: "password", value: password),
            URLQueryItem(name: "email", value: email),
            URLQueryItem(name: "gender", value: gender),
            URLQueryItem(name: "credit_card", value: creditCard),
            URLQueryItem(name: "bio", value: bio)
        ]
    }
}
