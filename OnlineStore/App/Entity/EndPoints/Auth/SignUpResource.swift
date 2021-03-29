//
//  SignUp.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 17.02.2021.
//

import Foundation

struct SignUpResource: EndPointType {
    
    typealias ModelType = IsSuccess
    let host      : BaseURL = .apiRequest
    let path      : Path = .signUp
    let userId    : Int
    let userName  : String
    let password  : String
    let email     : String
    let gender    : String
    let creditCard: String
    let bio       : String
    let httpMethod: HTTPMethod = .post
    var parameters: Parameters {
        [
          "userId"   : userId,
          "username" : userName,
          "password" : password,
          "email"    : email,
          "gender"   : gender,
          "creditCard": creditCard,
          "bio"      : bio
        ]
    }
    
}
