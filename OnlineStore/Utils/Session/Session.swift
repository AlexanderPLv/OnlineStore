//
//  Session.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 28.03.2021.
//

import Foundation

class Session {
    
    static let shared = Session()
    
    private init() {}
    var token: String? = nil
    var userId = 0
}
