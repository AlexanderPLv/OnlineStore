//
//  GetUserDataFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 26.03.2021.
//

import Foundation

protocol GetUserDataFactory {
    func getUserData(userId: Int, token: String, completionHandler: @escaping (Result<[UserProfile], NetworkingError>) -> Void)
}
