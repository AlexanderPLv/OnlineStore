//
//  LoginResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 15.02.2021.
//

import Foundation

struct SignInResource: EndPointType {
    typealias ModelType = LoginResult
    var host      : BaseURL = .apiRequest
    var path      : Path = .signIn
    let login     : String
    let password  : String
    var httpMethod: HTTPMethod = .post
    var parameters: Parameters {
        [
            "login": login,
            "password": password
        ]
    }
    
}
