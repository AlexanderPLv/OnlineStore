//
//  NetworkErrors.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.02.2021.
//

import Foundation

enum NetworkingError: String, Error {
    case invalidRequest = "invalid request."
    case badData = "Bad data."
    case parsingError = "Parsing error."
    case encodingFailed = "Parameter encoding failed."
    case parametersNil = "Parameters were nil."
    case missingURL = "Missing URL."
}
extension NetworkingError: LocalizedError {
    var errorDescription: String? { return NSLocalizedString(rawValue, comment: "")}
}
