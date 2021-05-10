//
//  CustomDecodableSerializer.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 12.02.2021.
//

import Foundation

//class DecodableSerializer<ModelType: Decodable> {
//    private let errorParser: AbstractErrorParser
//
//    init(errorParser: AbstractErrorParser) {
//        self.errorParser = errorParser
//    }
//
//    func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> ModelType {
//        if let error = errorParser.parse(response: response, data: data, error: error) {
//            throw error
//        }
//        
//        do {
//            
//            let value = try JSONDecoder().decode(ModelType.self, from: data)
//            return value
//        } catch {
//            let customError = errorParser.parse(error)
//            throw customError
//        }
//    }
//}
