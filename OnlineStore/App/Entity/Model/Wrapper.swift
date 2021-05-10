//
//  Wrapper.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.03.2021.
//

import Foundation

struct Wrapper<T: Decodable>: Decodable {
    let response: [T]
}
