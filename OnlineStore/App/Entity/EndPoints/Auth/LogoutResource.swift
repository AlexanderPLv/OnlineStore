//
//  LogoutResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

struct LogoutResouce: EndPointType {
    typealias ModelType = IsSuccess
    let httpMethod: HTTPMethod = .post
    let host      : BaseURL = .apiRequest
    let path      : Path = .logout
    let userId    : Int
    var parameters: Parameters {
        [
          "userId": userId
        ]
    }
    
}
