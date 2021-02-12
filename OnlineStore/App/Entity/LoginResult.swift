//
//  LoginResult.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 12.02.2021.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
}