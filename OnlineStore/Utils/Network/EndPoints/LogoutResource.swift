//
//  LogoutResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

struct LogoutResouce: EndPointType {
    typealias ModelType = IsSuccess
    var httpMethod: HTTPMethod = .post
    
    var host  : BaseURL = .apiRequest
    var path: Path = .logout
    var userId: String
    var parameters: Parameters = [:]
    var fields: [URLQueryItem] {
        [URLQueryItem(name: "id_user", value: userId)]
    }
}
