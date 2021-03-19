//
//  RequestRouter.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 12.02.2021.


import Foundation

protocol EndPointType {
    associatedtype ModelType: Decodable
    var host      : BaseURL    { get }
    var path      : Path       { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters { get }
}

extension EndPointType {
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host.baseURL
        components.path = path.path
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
            return "morning-crag-27614.herokuapp.com"
        }
    }
}

enum Path {
    case signIn
    case signUp
    case logout
    case changeUserData
    case review
}
extension Path {
    var path: String {
        switch self {
        case .signIn:
            return "/signIn"
        case .signUp:
            return "/signUp"
        case .logout:
            return "/logout"
        case .changeUserData:
            return "/changeUserData"
        case .review:
            return "/review"
        }
    }
}
