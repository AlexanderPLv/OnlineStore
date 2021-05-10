//
//  DecodableSerialazer.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.02.2021.
//

import Foundation

class DecodableSerializer<ModelType: Decodable> {
    func decode(_ data: Data) throws -> [ModelType] {
            let value = try JSONDecoder().decode(Wrapper<ModelType>.self, from: data)
        return value.response
    }
}
