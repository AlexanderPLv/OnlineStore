//
//  Review.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

struct Review: Codable {
    let userName: String
    let ratingValue: Int
    let text: String
}
