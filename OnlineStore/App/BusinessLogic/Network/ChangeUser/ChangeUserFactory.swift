//
//  ChangeDataFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

protocol ChangeUserFactory {
    func changeUser(userId: Int,
                    token: String,
                    completionHandler: @escaping (Result<[IsSuccess], NetworkingError>) -> Void)
}
