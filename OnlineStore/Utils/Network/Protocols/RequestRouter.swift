//
//  RequestRouter.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 12.02.2021.


import Foundation

protocol RequestRouter {
    
    var host: BaseURL { get }
    var method: Path { get }
    var fields: [URLQueryItem] { get }
}

extension RequestRouter {
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host.baseURL
        components.path = method.path
        components.queryItems = fields
        return components.url!
    }
    
}

enum BaseURL {
    case apiRequest
}
extension BaseURL {
    var baseURL: String {
        switch self {
        case .apiRequest:
            return "raw.githubusercontent.com"
        }
    }
}

enum Path {
    case auth
    case register
}
extension Path {
    var path: String {
        switch self {
        case .auth:
            return "/GeekBrainsTutorial/online-store-api/master/responses/login.json"
        case .register:
            return "/GeekBrainsTutorial/online-store-api/master/responses/registerUser.json"
        }
    }
}
