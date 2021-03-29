//
//  UserDataResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 26.03.2021.
//

import Foundation

struct UserDataResource: EndPointType {
    typealias ModelType = UserProfile
    let httpMethod: HTTPMethod = .post
    let host      : BaseURL = .apiRequest
    let path      : Path = .getUserData
    let userId    : Int
    let token     : String
    var parameters: Parameters {
        [
        "token"   : token,
        "userId"  : userId
        ]
    }
}
