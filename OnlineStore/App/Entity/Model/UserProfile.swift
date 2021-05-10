//
//  UserProfile.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 20.03.2021.
//

import Foundation

struct UserProfile: Codable {
    let userName: String
    let password: String
    let email: String
    let creditCard: String
    let gender: String?
    let bio: String?
}
