//
//  ChangeDataFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

protocol ChangeUserFactory {
    func changeUser(userId: Int,
                username: String,
                password: String,
                email: String,
                gender: String,
                creditCard: String,
                bio: String,
                completionHandler: @escaping (Result<[IsSuccess], NetworkingError>) -> Void)
}
