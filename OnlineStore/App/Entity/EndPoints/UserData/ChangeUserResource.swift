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
    let token     : String
    var parameters: Parameters {
        [
      "userId"    : userId,
      "token"     : token
        ]
    }
}
