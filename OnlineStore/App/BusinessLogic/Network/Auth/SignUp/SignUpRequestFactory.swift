//
//  SignUpRequestFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.02.2021.
//

import Foundation

protocol SignUpRequestFactory {
    func signUp(idUser: Int,
                userName: String,
                password: String,
                email: String,
                gender: String,
                creditCard: String,
                bio: String,
                completionHandler: @escaping (Result<RegisterUser, NetworkingError>) -> Void)
}
