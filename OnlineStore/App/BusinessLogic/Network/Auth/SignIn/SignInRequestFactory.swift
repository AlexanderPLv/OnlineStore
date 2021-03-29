//
//  AuthRequestFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 12.02.2021.
//

import Foundation

protocol SignInRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (Result<[Token], NetworkingError>) -> Void)
}
