//
//  LogoutRequestFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.02.2021.
//

import Foundation

protocol LogoutRequestFactory {
    func logout(userId: String, completion: @escaping (Result<IsSuccess, NetworkingError>) -> Void)
}
