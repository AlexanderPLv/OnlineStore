//
//  LogoutResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

struct LogoutResouce: RequestRouter {
    var host  : BaseURL = .apiRequest
    var method: Path = .logout
    var userId: String
    var fields: [URLQueryItem] {
        [URLQueryItem(name: "id_user", value: userId)]
    }
}
