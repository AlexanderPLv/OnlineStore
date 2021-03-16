//
//  SignUp.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 17.02.2021.
//

import Foundation

struct SignUpResource: RequestRouter {
    var host      : BaseURL = .apiRequest
    var path    : Path = .signUp
    let idUser    : String
    let userName  : String
    let password  : String
    let email     : String
    let gender    : String
    let creditCard: String
    let bio       : String
    var fields    : [URLQueryItem]  {
        [ URLQueryItem(name: "id_user", value: idUser),
          URLQueryItem(name: "username", value: userName),
          URLQueryItem(name: "password", value: password),
          URLQueryItem(name: "email", value: email),
          URLQueryItem(name: "gender", value: gender),
          URLQueryItem(name: "credit_card", value: creditCard),
          URLQueryItem(name: "bio", value: bio)
        ]
    }
}
