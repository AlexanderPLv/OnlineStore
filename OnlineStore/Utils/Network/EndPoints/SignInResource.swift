//
//  LoginResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 15.02.2021.
//

import Foundation

struct SignInResource: RequestRouter {
    var host     : BaseURL = .apiRequest
    var method   : Path = .auth
    let login    : String
    let password : String
    var fields   : [URLQueryItem]  {
        [ URLQueryItem(name: "login", value: login),
          URLQueryItem(name: "password", value: password)]
    }
    
}
