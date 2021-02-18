//
//  NetworkErrors.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.02.2021.
//

import Foundation

enum NetworkingError: String, Error {
    case invalidRequest = "invalid request"
    case badData = "bad data"
    case parsingError = "parsing error"
}
extension NetworkingError: LocalizedError {
    var errorDescription: String? { return NSLocalizedString(rawValue, comment: "")}
}
