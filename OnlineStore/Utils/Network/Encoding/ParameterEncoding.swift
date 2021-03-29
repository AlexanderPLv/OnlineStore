//
//  ParametersEncoding.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 16.03.2021.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
