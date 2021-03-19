//
//  ChangeUserResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

struct ChangeUserResource: EndPointType {
    typealias ModelType = IsSuccess
    let httpMethod: HTTPMethod = .post
    let host      : BaseURL = .apiRequest
    let path      : Path = .changeUserData
    let userId    : Int
    let username  : String
    let password  : String
    let email     : String
    let gender    : String
    let creditCard: String
    let bio       : String
    var parameters: Parameters {
        [
      "userId"    : userId,
      "username"  : username,
      "password"  : password,
      "email"     : email,
      "gender"    : gender,
      "creditCard": creditCard,
      "bio"       : bio
        ]
    }
}
