//
//  RegisterUser.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 17.02.2021.
//

import Foundation

struct RegisterUser: Codable {
    let result: Int
    let userMessage: String?
    let errorMessage: String?
}
